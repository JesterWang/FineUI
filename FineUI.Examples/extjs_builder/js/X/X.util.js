
// FineUI应用程序域
var X = function (cmpName) {
    return Ext.getCmp(cmpName);
};

X.state = function (cmp, state) {
    X.util.setXState(cmp, state);
};

X.enable = function (id) {
    X.util.enableSubmitControl(id);
};

X.disable = function (id) {
    X.util.disableSubmitControl(id);
};

X.target = function (target) {
    return X.util.getTargetWindow(target);
};

X.alert = function () {
    X.util.alert.apply(window, arguments);
};

X.init = function () {
    if (typeof (onInit) == 'function') {
        onInit();
    }
};

X.ready = function () {
    if (typeof (onReady) == 'function') {
        onReady();
    }
};

X.ajaxReady = function () {
    if (typeof (onAjaxReady) == 'function') {
        onAjaxReady();
    }
};

X.stop = function () {
    var event = arguments.callee.caller.arguments[0] || window.event;
    X.util.stopEventPropagation(event);
};

X.confirm = function () {
    X.util.confirm.apply(null, arguments);
};

X.toggle = function (el, className) {
    Ext.get(el).toggleCls(className);
};

X.fieldValue = function (cmp) {
    return X.util.getFormFieldValue(cmp);
};

(function () {


    // FineUI常用函数域（Utility）
    X.util = {

        alertTitle: "Alert Dialog",
        confirmTitle: "Confirm Dialog",
        formAlertMsg: "Please provide valid value for {0}!",
        formAlertTitle: "Form Invalid",
        loading: "Loading...",

        // 下拉列表的模板
        ddlTPL: '<tpl for="."><div class="x-boundlist-item<tpl if="!enabled"> x-boundlist-item-disabled</tpl>">{prefix}{text}</div></tpl>',

        // 初始化
        init: function (msgTarget, labelWidth, labelSeparator,
            blankImageUrl, enableAjaxLoading, ajaxLoadingType, enableAjax, themeName) {
            // Ext.QuickTips.init(true); 在原生的IE7（非IE8下的IE7模式）会有问题
            // 表现为iframe中的页面出现滚动条时，页面上的所有按钮都不能点击了。
            // 测试例子在：aspnet/test.aspx
            //Ext.QuickTips.init(false);
            Ext.tip.QuickTipManager.init();

            X.ajax.hookPostBack();

            X.global_enable_ajax = enableAjax;

            X.global_enable_ajax_loading = enableAjaxLoading;
            X.global_ajax_loading_type = ajaxLoadingType;

            // 添加Ajax Loading提示节点
            X.ajaxLoadingDefault = Ext.get(X.util.appendLoadingNode());
            X.ajaxLoadingMask = Ext.create('Ext.LoadMask', Ext.getBody(), { msg: X.util.loading });


            X.form_upload_file = false;
            X.global_disable_ajax = false;
            //X.x_window_manager = new Ext.WindowManager();
            //X.x_window_manager.zseed = 6000;

            X.util.setHiddenFieldValue('X_CHANGED', 'false');
            document.forms[0].autocomplete = 'off';

            // 向document.body添加主题类
            if (themeName) {
                Ext.getBody().addCls('theme-' + themeName);
            }

            if (Ext.form.field) {
                var fieldPro = Ext.form.field.Base.prototype;
                fieldPro.msgTarget = msgTarget;
                fieldPro.labelWidth = labelWidth;
                fieldPro.labelSeparator = labelSeparator;
                fieldPro.autoFitErrors = true;
            }


            //if (enableBigFont) {
            //    Ext.getBody().addCls('bigfont');
            //}

            // Default empty image
            if (Ext.isIE6 || Ext.isIE7) {
                Ext.BLANK_IMAGE_URL = blankImageUrl;
            }

        },


        setXState: function (cmp, state) {
            if (!cmp || !cmp['x_state']) {
                return;
            }

            var oldValue, newValue, el;
            // 如果state中包含CssClass，也就是在服务器端修改了CssClass属性，则需要首先删除原来的CssClass属性。
            if (typeof (state['CssClass']) !== 'undefined') {
                newValue = state['CssClass'];
                oldValue = cmp['x_state']['CssClass'];
                if (!oldValue) {
                    oldValue = cmp.initialConfig.cls;
                }
                el = cmp.el;
                el.removeCls(oldValue);
                el.addCls(newValue);
            }

            //if (typeof (state['FormItemClass']) !== 'undefined') {
            //    newValue = state['FormItemClass'];
            //    oldValue = cmp['x_state']['FormItemClass'];
            //    if (!oldValue) {
            //        oldValue = cmp.initialConfig.itemCls;
            //    }
            //    // Search for max 10 depth.
            //    el = cmp.el.findParent('.x-form-item', 10, true);
            //    el.removeCls(oldValue);
            //    el.addCls(newValue);
            //}

            Ext.apply(cmp['x_state'], state);

        },

        stopEventPropagation: function (event) {
            event = event || window.event;
            if (typeof (event.cancelBubble) === 'boolean') {
                event.cancelBubble = true;
            } else {
                event.stopPropagation();
            }
        },

        // 绑定函数的上下文
        bind: function (fn, scope) {
            return function () {
                return fn.apply(scope, arguments);
            };
        },

        // 在页面上查找id为findId的节点，替换成replaceHtml
        replace: function (findId, replaceHtml) {
            // 在findId外面添加一个DIV层，然后更新此wrapper的InnerHTML
            var findedControl = Ext.get(findId);
            if (findedControl) {
                var wrapper = findedControl.wrap().update(replaceHtml);
                // 将新增的节点移到wrapper上面
                wrapper.first().insertBefore(wrapper);
                // 然后删除wrapper
                wrapper.remove();
            }
        },

        // 去除PageLoading节点
        removePageLoading: function (fadeOut) {
            if (fadeOut) {
                Ext.get("loading").remove();
                Ext.get("loading-mask").fadeOut({ remove: true });
            }
            else {
                Ext.get("loading").remove();
                Ext.get("loading-mask").remove();
            }
        },


        // 去掉字符串中的html标签
        stripHtmlTags: function (str) {
            return str.replace(/<[^>]*>/g, "");
        },


        // 弹出Alert对话框
        alert: function (msg, title, icon, okscript) {
            title = title || X.util.alertTitle;
            icon = icon || Ext.MessageBox.INFO;
            Ext.MessageBox.show({
                title: title,
                msg: msg,
                buttons: Ext.MessageBox.OK,
                icon: icon,
                fn: function (buttonId) {
                    if (buttonId === "ok") {
                        if (typeof (okscript) === "function") {
                            okscript.call(window);
                        }
                    }
                }
            });
        },

        // 向页面添加Loading...节点
        appendLoadingNode: function () {
            return X.util.appendFormNode({ tag: "div", cls: "x-ajax-loading", html: X.util.loading });
        },

        // 向页面的 form 节点最后添加新的节点
        appendFormNode: function (htmlOrObj) {
            return Ext.DomHelper.append(document.forms[0], htmlOrObj);
        },

        // 向页面添加一个隐藏字段，如果已经存在则更新值
        setHiddenFieldValue: function (fieldId, fieldValue) {
            var itemNode = Ext.get(fieldId);
            if (!itemNode) {
                // Ext.DomHelper.append 有问题，例如下面这个例子得到的结果是错的；变通一下，先插入节点，在设置节点的值。
                // Ext.DomHelper.append(document.forms[0], { tag: "input", type: "hidden", value: '{"X_Items":[["Value1","选项 1",1],["Value2","选项 2（不可选择）",0],["Value3","选项 3（不可选择）",0],["Value4","选项 4",1],["Value5","选项 5",1],["Value6","选项 6",1],["Value7","选项 7",1],["Value8","选项 8",1],["Value9","选项 9",1]],"SelectedValue":"Value1"}'});
                // 上面的这个字符串，在IETest的IE8模式下会变成：
                // {"DropDownList1":{"X_Items":[["Value1","\u9009\u9879 1",1],["Value2","\u9009\u9879 2\uff08\u4e0d\u53ef\u9009\u62e9\uff09",0],["Value3","\u9009\u9879 3\uff08\u4e0d\u53ef\u9009\u62e9\uff09",0],["Value4","\u9009\u9879 4",1],["Value5","\u9009\u9879 5",1],["Value6","\u9009\u9879 6",1],["Value7","\u9009\u9879 7",1],["Value8","\u9009\u9879 8",1],["Value9","\u9009\u9879 9",1]],"SelectedValue":"Value1"}}

                X.util.appendFormNode({ tag: "input", type: "hidden", id: fieldId, name: fieldId });
                Ext.get(fieldId).dom.value = fieldValue;
            }
            else {
                itemNode.dom.value = fieldValue;
            }
        },

        // 从表单中删除隐藏字段
        removeHiddenField: function (fieldId) {
            var itemNode = Ext.get(fieldId);
            if (itemNode) {
                itemNode.remove();
            }
        },

        // 获取页面中一个隐藏字段的值
        getHiddenFieldValue: function (fieldId) {
            var itemNode = Ext.get(fieldId);
            if (itemNode) {
                return itemNode.getValue();
            }
            return null;
        },

        // 禁用提交按钮（在回发之前禁用以防止重复提交）
        disableSubmitControl: function (controlClientID) {
            X(controlClientID).disable();
            X.util.setHiddenFieldValue('X_TARGET', controlClientID);
        },

        // 启用提交按钮（在回发之后启用提交按钮）
        enableSubmitControl: function (controlClientID) {
            X(controlClientID).enable();
            X.util.setHiddenFieldValue('X_TARGET', '');
        },

        // 更新ViewState的值
        updateViewState: function (newValue, startIndex, gzipped) {
            if (typeof (startIndex) === 'boolean') {
                gzipped = startIndex;
                startIndex = -1;
            }

            var viewStateHiddenFiledID = "__VIEWSTATE";
            if (gzipped) {
                viewStateHiddenFiledID = "__VIEWSTATE_GZ";
            }

            var oldValue = X.util.getHiddenFieldValue(viewStateHiddenFiledID);
            if (Ext.type(startIndex) == "number" && startIndex > 0) {
                if (startIndex < oldValue.length) {
                    oldValue = oldValue.substr(0, startIndex);
                }
            } else {
                // Added on 2011-5-2, this is a horrible mistake.
                oldValue = '';
            }
            X.util.setHiddenFieldValue(viewStateHiddenFiledID, oldValue + newValue);
        },

        // 更新EventValidation的值
        updateEventValidation: function (newValue) {
            X.util.setHiddenFieldValue("__EVENTVALIDATION", newValue);
        },

        // 设置页面状态是否改变
        setPageStateChanged: function () {
            var pageState = Ext.get("X_CHANGED");
            if (pageState && pageState.getValue() == "false") {
                pageState.dom.value = "true";
            }
        },

        // 页面状态是否改变
        isPageStateChanged: function () {
            var pageState = Ext.get("X_CHANGED");
            if (pageState && pageState.getValue() == "true") {
                return true;
            }
            return false;
        },


        // 验证多个表单，返回数组[是否验证通过，第一个不通过的表单字段]
        validForms: function (forms, targetName, showBox) {
            var target = X.util.getTargetWindow(targetName);
            var valid = true;
            var firstInvalidField = null;
            for (var i = 0; i < forms.length; i++) {
                var result = X(forms[i]).x_isValid();
                if (!result[0]) {
                    valid = false;
                    if (firstInvalidField == null) {
                        firstInvalidField = result[1];
                    }
                }
            }

            if (!valid) {
                if (showBox) {
                    var alertMsg = Ext.String.format(X.util.formAlertMsg, firstInvalidField.fieldLabel);
                    target.X.util.alert(alertMsg, X.util.formAlertTitle, Ext.MessageBox.INFO);
                }
                return false;
            }
            return true;
        },


        // 判断隐藏字段值（数组）是否包含value
        isHiddenFieldContains: function (domId, testValue) {
            testValue += "";
            var domValue = Ext.get(domId).dom.value;
            if (domValue === "") {
                //console.log(domId);
                return false;
            }
            else {
                var sourceArray = domValue.split(",");
                return sourceArray.indexOf(testValue) >= 0 ? true : false;
            }
        },


        // 将一个字符添加到字符列表中，将2添加到[5,3,4]
        addValueToHiddenField: function (domId, addValue) {
            addValue += "";
            var domValue = Ext.get(domId).dom.value;
            if (domValue == "") {
                Ext.get(domId).dom.value = addValue + "";
            }
            else {
                var sourceArray = domValue.split(",");
                if (sourceArray.indexOf(addValue) < 0) {
                    sourceArray.push(addValue);
                    Ext.get(domId).dom.value = sourceArray.join(",");
                }
            }
        },


        // 从字符列表中移除一个字符，将2从dom的值"5,3,4,2"移除
        removeValueFromHiddenField: function (domId, addValue) {
            addValue += "";
            var domValue = Ext.get(domId).dom.value;
            if (domValue != "") {
                var sourceArray = domValue.split(",");
                if (sourceArray.indexOf(addValue) >= 0) {
                    sourceArray = sourceArray.remove(addValue);
                    Ext.get(domId).dom.value = sourceArray.join(",");
                }
            }
        },


        // 取得隐藏字段的值
        getHiddenFieldValue: function (fieldId) {
            var itemNode = Ext.get(fieldId);
            if (!itemNode) {
                return "";
            }
            else {
                return itemNode.dom.value;
            }
        },


        // 取得表单字段的值
        getFormFieldValue: function (cmp) {
            if (typeof (cmp) === 'string') {
                cmp = X(cmp);
            }
            var value = cmp.getValue();
            if (cmp.isXType('displayfield')) {
                value = value.replace(/<\/?span[^>]*>/ig, '');
            }
            return value;
        },


        // 由target获取window对象
        getTargetWindow: function (target) {
            var wnd = window;
            if (target === '_self') {
                wnd = window;
            } else if (target === '_parent') {
                wnd = parent;
            } else if (target === '_top') {
                wnd = top;
            }
            return wnd;
        },


        // 预加载图片
        preloadImages: function (images) {
            var imageInstance = [];
            for (var i = 0; i < images.length; i++) {
                imageInstance[i] = new Image();
                imageInstance[i].src = images[i];
            }
        },

        hasCSS: function (id) {
            return !!Ext.get(id);
        },

        addCSS: function (id, content) {

            // 如果此节点已经存在，则先删除此节点
            var node = Ext.get(id);
            if (node) {
                Ext.removeNode(node.dom);
            }

            // Tricks From: http://www.phpied.com/dynamic-script-and-style-elements-in-ie/
            var ss1 = document.createElement("style");
            ss1.setAttribute("type", "text/css");
            ss1.setAttribute("id", id);
            if (ss1.styleSheet) {   // IE
                ss1.styleSheet.cssText = content;
            } else {                // the world
                var tt1 = document.createTextNode(content);
                ss1.appendChild(tt1);
            }
            var hh1 = document.getElementsByTagName("head")[0];
            hh1.appendChild(ss1);
        },

        /*
        // 在启用AJAX的情况下，使所有的Asp.net的提交按钮（type="submit"）不要响应默认的submit行为，而是自定义的AJAX
        makeAspnetSubmitButtonAjax: function (buttonId) {

        // 低版本IE浏览器不允许使用JS修改input标签的type属性，导致此函数无效
        function resetButton(button) {
        button.set({ "type": "button" });
        button.addListener("click", function (event, el) {
        __doPostBack(el.getAttribute("name"), "");
        event.stopEvent();
        });
        }

        if (typeof (buttonId) === "undefined") {
        Ext.Array.each(Ext.DomQuery.select("input[type=submit]"), function (item, index) {
        resetButton(Ext.get(item));
        });
        } else {
        var button = Ext.get(buttonId);
        if (button.getAttribute("type") === "submit") {
        resetButton(button);
        }
        }

        },

        */

        htmlEncode: function (str) {
            var div = document.createElement("div");
            div.appendChild(document.createTextNode(str));
            return div.innerHTML;
        },

        htmlDecode: function (str) {
            var div = document.createElement("div");
            div.innerHTML = str;
            return div.innerHTML;
        },


        // Whether a object is empty (With no property) or not.
        // 可以使用 Ext.Object.isEmpty
        isObjectEmpty: function (obj) {
            for (var prop in obj) {
                if (obj.hasOwnProperty(prop)) {
                    return false;
                }
            }
            return true;
        },

        // Convert an array to object.
        // ['Text', 'Icon']  -> {'Text':true, 'Icon': true}
        arrayToObject: function (arr) {
            var obj = {};
            Ext.Array.each(arr, function (item, index) {
                obj[item] = true;
            });
            return obj;
        },

        hideScrollbar: function () {
            if (Ext.isIE) {
                window.document.body.scroll = 'no';
            } else {
                window.document.body.style.overflow = 'hidden';
            }
        },


        // 动态添加一个标签页
        // mainTabStrip： 选项卡实例
        // id： 选项卡ID
        // url: 选项卡IFrame地址 
        // text： 选项卡标题
        // icon： 选项卡图标
        // addTabCallback： 创建选项卡前的回调函数（接受tabConfig参数）
        // refreshWhenExist： 添加选项卡时，如果选项卡已经存在，是否刷新内部IFrame
        addMainTab: function (mainTabStrip, id, url, text, icon, addTabCallback, refreshWhenExist) {
            var iconId, iconCss, tabId, currentTab, tabConfig;

            // 兼容 addMainTab(mainTabStrip, treeNode, addTabCallback, refreshWhenExist) 调用方式
            if (typeof (id) !== 'string') {
                refreshWhenExist = text;
                addTabCallback = url;
                url = id.data.href;
                icon = id.data.icon;
                text = id.data.text;

                id = id.getId();
            }

            //var href = node.attributes.href;
            if (icon) {
                iconId = icon.replace(/\W/ig, '_');
                if (!X.util.hasCSS(iconId)) {
                    iconCss = [];
                    iconCss.push('.');
                    iconCss.push(iconId);
                    iconCss.push('{background-image:url("');
                    iconCss.push(icon);
                    iconCss.push('")}');
                    X.util.addCSS(iconId, iconCss.join(''));
                }
            }
            // 动态添加一个带工具栏的标签页
            //tabId = 'dynamic_added_tab' + id.replace('__', '-');
            currentTab = mainTabStrip.getTab(id);
            if (!currentTab) {
                tabConfig = {
                    'id': id,
                    'url': url,
                    'title': text,
                    'closable': true,
                    'bodyStyle': 'padding:0px;'
                };
                if (icon) {
                    tabConfig['iconCls'] = iconId;
                }

                if (addTabCallback) {
                    var addTabCallbackResult = addTabCallback.apply(window, [tabConfig]);
                    // 兼容之前的方法，函数返回值如果不为空，则将返回值作为顶部工具条实例
                    if (addTabCallbackResult) {
                        tabConfig['tbar'] = addTabCallbackResult;
                    }
                }
                mainTabStrip.addTab(tabConfig);
            } else {
                mainTabStrip.setActiveTab(currentTab);
                if (refreshWhenExist) {
                    var iframeNode = currentTab.body.query('iframe')[0];
                    if (iframeNode) {
                        iframeNode.contentWindow.location.reload();
                    }
                }

            }
        },

        // 初始化左侧树（或者手风琴+树）与右侧选项卡控件的交互
        // treeMenu： 主框架中的树控件实例，或者内嵌树控件的手风琴控件实例
        // mainTabStrip： 选项卡实例
        // addTabCallback： 创建选项卡前的回调函数（接受tabConfig参数）
        // updateLocationHash: 切换Tab时，是否更新地址栏Hash值
        // refreshWhenExist： 添加选项卡时，如果选项卡已经存在，是否刷新内部IFrame
        // refreshWhenTabChange: 切换选项卡时，是否刷新内部IFrame
        initTreeTabStrip: function (treeMenu, mainTabStrip, addTabCallback, updateLocationHash, refreshWhenExist, refreshWhenTabChange) {

            // 注册树的节点点击事件
            function registerTreeClickEvent(treeInstance) {
                treeInstance.on('itemclick', function (view, record, item, index, event) {
                    if (record.isLeaf()) {
                        // 阻止事件传播
                        event.stopEvent();

                        var href = record.data.href;

                        if (updateLocationHash) {
                            // 修改地址栏
                            window.location.hash = '#' + href;
                        }

                        // 新增Tab节点
                        X.util.addMainTab(mainTabStrip, record, addTabCallback, refreshWhenExist);
                    }
                });
            }

            // treeMenu可能是Accordion或者Tree
            if (treeMenu.getXType() === 'panel') {
                treeMenu.items.each(function (item) {
                    var tree = item.items.getAt(0);
                    if (tree && tree.getXType() === 'treepanel') {
                        registerTreeClickEvent(tree);
                    }
                });
            } else if (treeMenu.getXType() === 'treepanel') {
                registerTreeClickEvent(treeMenu);
            }

            // 切换主窗口的Tab
            mainTabStrip.on('tabchange', function (tabStrip, tab) {
                var tabHash = '#' + (tab.url || '');

                // 只有当浏览器地址栏的Hash值和将要改变的不一样时，才进行如下两步处理：
                // 1. 更新地址栏Hash值
                // 2. 刷新Tab内的IFrame
                if (tabHash !== window.location.hash) {

                    if (updateLocationHash) {
                        window.location.hash = tabHash;
                    }

                    if (refreshWhenTabChange) {
                        var iframeNode = tab.body.query('iframe')[0];
                        if (iframeNode) {
                            var currentLocationHref = iframeNode.contentWindow.location.href;
                            if (/^http(s?):\/\//.test(currentLocationHref)) {
                                iframeNode.contentWindow.location.reload();
                            }
                        }
                    }
                }

            });


            // 页面第一次加载时，根据URL地址在主窗口加载页面
            var HASH = window.location.hash.substr(1);
            if (HASH) {
                var FOUND = false;

                function initTreeMenu(treeInstance, node) {
                    var i, currentNode, nodes, node, path;
                    if (!FOUND && node.hasChildNodes()) {
                        nodes = node.childNodes;
                        for (i = 0; i < nodes.length; i++) {
                            currentNode = nodes[i];
                            if (currentNode.isLeaf()) {
                                if (currentNode.data.href === HASH) {
                                    path = currentNode.getPath();
                                    treeInstance.expandPath(path); //node.expand();
                                    treeInstance.selectPath(path); // currentNode.select();
                                    X.util.addMainTab(mainTabStrip, currentNode, addTabCallback);
                                    FOUND = true;
                                    return;
                                }
                            } else {
                                arguments.callee(treeInstance, currentNode);
                            }
                        }
                    }
                }

                if (treeMenu.getXType() === 'panel') {
                    treeMenu.items.each(function (item) {
                        var tree = item.items.getAt(0);
                        if (tree && tree.getXType() === 'treepanel') {
                            initTreeMenu(tree, tree.getRootNode());

                            // 找到树节点
                            if (FOUND) {
                                item.expand();
                                return false;
                            }
                        }
                    });
                } else if (treeMenu.getXType() === 'treepanel') {
                    initTreeMenu(treeMenu, treeMenu.getRootNode());
                }
            }




        },

        // 复选框分组处理
        resolveCheckBoxGroup: function (name, xstateContainer, isradiogroup) {
            var items = [], i, count, xitem, xitemvalue, xitems, xselectedarray, xselected, xchecked, xitemname;

            xitems = xstateContainer.X_Items;
            xselectedarray = xstateContainer.SelectedValueArray;
            xselected = xstateContainer.SelectedValue;

            if (xitems && xitems.length > 0) {
                for (i = 0, count = xitems.length; i < count; i++) {
                    xitem = xitems[i];
                    xitemvalue = xitem[1];
                    xchecked = false;
                    if (!isradiogroup) {
                        // xselectedarray 可能是undefined, [], ["value1", "value2"]
                        if (xselectedarray) {
                            xchecked = (xselectedarray.indexOf(xitemvalue) >= 0) ? true : false;
                        }
                        xitemname = name + '_' + i;
                    } else {
                        xchecked = (xselected === xitemvalue) ? true : false;
                        xitemname = name;
                    }
                    items.push({
                        'inputValue': xitemvalue,
                        'boxLabel': xitem[0],
                        'name': xitemname,
                        'checked': xchecked
                    });
                }
            }
            /*
            else {
                items.push({
                    'inputValue': "tobedeleted",
                    'boxLabel': "&nbsp;",
                    'name': "tobedeleted"
                });
            }
            */
            return items;

        },

        // 防止在短时间内，同一GroupName的单选框触发两次事件
        // 用于 MenuCheckBox 和 RadioButton
        checkGroupLastTime: function (groupName) {
            var checkName = groupName + '_lastupdatetime';
            var checkValue = X.util[checkName];
            X.util[checkName] = new Date();
            if (typeof (checkValue) === 'undefined') {
                return true;
            } else {
                if ((new Date() - checkValue) < 100) {
                    return false;
                } else {
                    return true;
                }
            }
        },

        // 对话框图标
        getMessageBoxIcon: function (iconShortName) {
            var icon = Ext.MessageBox.WARNING;
            if (iconShortName === 'info') {
                icon = Ext.MessageBox.INFO;
            } else if (iconShortName === 'warning') {
                icon = Ext.MessageBox.WARNING;
            } else if (iconShortName === 'question') {
                icon = Ext.MessageBox.QUESTION;
            } else if (iconShortName === 'error') {
                icon = Ext.MessageBox.ERROR;
            }
            return icon;
        },

        // 确认对话框
        confirm: function (targetName, title, msg, okScript, cancelScript, iconShortName) {
            var wnd = X.util.getTargetWindow(targetName);
            var icon = X.util.getMessageBoxIcon(iconShortName);
            wnd.Ext.MessageBox.show({
                title: title || X.util.confirmTitle,
                msg: msg,
                buttons: Ext.MessageBox.OKCANCEL,
                icon: icon,
                fn: function (btn) {
                    if (btn == 'cancel') {
                        if (cancelScript) {
                            new Function(cancelScript)();
                        } else {
                            return false;
                        }
                    } else {
                        if (okScript) {
                            new Function(okScript)();
                        } else {
                            return false;
                        }
                    }
                }
            });
        }


    };




})();