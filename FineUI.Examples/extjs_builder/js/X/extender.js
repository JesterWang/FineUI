
Ext.override(Ext.Component, {

    x_setDisabled: function () {
        this.setDisabled(!this.x_state['Enabled']);
    },

    x_setVisible: function () {
        this.setVisible(!this.x_state['Hidden']);
    }

});

// 验证一个表单是否有效，会递归查询表单中每个字段
// 如果表单隐藏或者字段隐藏，则不进行有效性校验
Ext.override(Ext.container.Container, {
    x_isValid: function () {
        var valid = true;
        var firstInvalidField = null;
        if (!this.hidden) {
            this.items.each(function (f) {
                if (!f.hidden) {
                    if (f.isXType('field') || f.isXType('checkboxgroup')) {
                        if (!f.validate()) {
                            valid = false;
                            if (firstInvalidField == null) {
                                firstInvalidField = f;
                            }
                        }
                    } else if (f.items) {
                        var validResult = f.x_isValid();
                        if (!validResult[0]) {
                            valid = false;
                            if (firstInvalidField == null) {
                                firstInvalidField = validResult[1];
                            }
                        }
                    }
                }
            });
        }
        return [valid, firstInvalidField];
    },

    x_reset: function () {
        this.items.each(function (f) {
            if (f.isXType('field')) {
                f.reset();
            } else if (f.items) {
                validResult = this.x_reset();
            }
        });
    }

});

Ext.override(Ext.panel.Panel, {
    x_setCollapse: function () {
        var collapsed = this.x_state['Collapsed'];
        if (collapsed) {
            this.collapse();
        } else {
            this.expand();
        }
    },

    x_isCollapsed: function () {
        var collapsed = false;
        var state = this.getState();
        if (state && state.collapsed) {
            collapsed = true;
        }
        return collapsed;
    },

    x_setTitle: function () {
        this.setTitle(this.x_state['Title']);
    }

});

Ext.override(Ext.form.FieldSet, {
    x_setCollapse: function () {
        var collapsed = this.x_state['Collapsed'];
        if (collapsed) {
            this.collapse();
        } else {
            this.expand();
        }
    },

    x_isCollapsed: function () {
        var collapsed = false;
        var state = this.getState();
        if (state && state.collapsed) {
            collapsed = true;
        }
        return collapsed;
    },

    x_setTitle: function () {
        this.setTitle(this.x_state['Title']);
    }

});

if (Ext.menu.CheckItem) {
    Ext.override(Ext.menu.CheckItem, {

        x_setChecked: function () {
            this.setChecked(this.x_state['Checked'], true);
        }

    });
}

if (Ext.form.field.Base) {
    Ext.override(Ext.form.field.Base, {

        //  Add functionality to Field's initComponent to enable the change event to bubble
        /*
        initComponent: Ext.form.Field.prototype.initComponent.createSequence(function () {
            this.enableBubble('change');
        }),
        */

        /* 这会导致在文本输入框中按回车键，无法触发type=submit的表单回发事件
        listeners: {
        specialkey: function (field, e) {
        if (e.getKey() == e.ENTER) {
        e.stopEvent();
        }
        }
        },
        */

        /*
        // When show or hide the field, also hide the label.
        hide: function () {
        Ext.form.Field.superclass.hide.call(this);
        //this.callOverridden();

        //var label = Ext.get(this.el.findParent('div[class=x-form-item]')).first('label[for=' + this.id + ']');
        var labelAndField = this.el.findParentNode('div[class*=x-form-item]', 10, true);
        if (labelAndField) {
        if (this.hideMode == 'display') {
        labelAndField.setVisibilityMode(Ext.Element.DISPLAY);
        } else {
        labelAndField.setVisibilityMode(Ext.Element.VISIBILITY);
        }
        labelAndField.hide();
        }
        },

        show: function () {
        Ext.form.Field.superclass.show.call(this);
        //this.callOverridden();

        //var label = Ext.get(this.el.findParent('div[class=x-form-item]')).first('label[for=' + this.id + ']');
        var labelAndField = this.el.findParentNode('div[class*=x-form-item]', 10, true);
        if (labelAndField) {
        if (this.hideMode == 'display') {
        labelAndField.setVisibilityMode(Ext.Element.DISPLAY);
        } else {
        labelAndField.setVisibilityMode(Ext.Element.VISIBILITY);
        }
        labelAndField.show();
        }
        },
        */

        x_setValue: function (value) {
            if (typeof (value) === 'undefined') {
                value = this.x_state['Text'];
            }
            this.setValue(value);
        },

        x_setLabel: function (text) {
            if (this.label && this.label.update) {
                this.label.update(text || this.x_state['Label']);
            }
        }

    });
}

if (Ext.form.field.Time) {
    Ext.override(Ext.form.field.Time, {

        // Time 继承自 ComboBox，这个函数被覆盖了，因此需要重新定义
        x_setValue: function (value) {
            if (typeof (value) === 'undefined') {
                value = this.x_state['Text'];
            }
            this.setValue(value);
        }

    });
}


if (Ext.form.field.HtmlEditor) {
    Ext.override(Ext.form.field.HtmlEditor, {

        x_setValue: function (text) {
            if (typeof (text) === 'undefined') {
                text = this.x_state['Text'];
            }
            this.setValue(text);
        }

    });
}


if (Ext.form.field.Checkbox) {
    Ext.override(Ext.form.field.Checkbox, {

        x_setValue: function () {
            this.setValue(this.x_state['Checked']);
        }

    });
}


if (Ext.form.RadioGroup) {
    Ext.override(Ext.form.RadioGroup, {

        x_setValue: function (value) {
            value = value || this.x_state['SelectedValue'];
            var selectedObj = {};
            selectedObj[this.name] = value;
            this.setValue(selectedObj);
            //Ext.form.CheckboxGroup.prototype.x_setValue.apply(this, [value]);
        }

    });
}


if (Ext.form.CheckboxGroup) {
    Ext.override(Ext.form.CheckboxGroup, {

        x_reloadData: function (name, isradiogroup) {
            var container = this.ownerCt;
            var newConfig = Ext.apply(this.initialConfig, {
                "x_state": this.x_state,
                "items": X.util.resolveCheckBoxGroup(name, this.x_state, isradiogroup)
            });

            if (container) {
                var originalIndex = container.items.indexOf(this);
                container.remove(this, true);

                if (isradiogroup) {
                    container.insert(originalIndex, Ext.create('Ext.form.RadioGroup', newConfig));
                } else {
                    container.insert(originalIndex, Ext.create('Ext.form.CheckboxGroup', newConfig));
                }
                container.doLayout();
            } else {
                this.destroy();
                if (isradiogroup) {
                    Ext.create('Ext.form.RadioGroup', newConfig);
                } else {
                    Ext.create('Ext.form.CheckboxGroup', newConfig);
                }

            }
        },

        /*
        x_toBeDeleted: function () {
            var tobedeleted = this.items.items[0];
            if (tobedeleted && tobedeleted.inputValue === 'tobedeleted') {
                tobedeleted.destroy();
                this.items.remove(tobedeleted);
            }
        },
        */

        // 选中项
        x_setValue: function (values) {
            // valueArray：["value1", "value2", "value3"]
            var values = values || this.x_state['SelectedValueArray'];
            
            var selectedObj = {};
            this.items.each(function (item) {
                var itemSelected = false;
                if (values.indexOf(item.inputValue) >= 0) {
                    itemSelected = true;
                }
                selectedObj[item.name] = itemSelected;
            });

            this.setValue(selectedObj);
        },

        // 返回 ["value1", "value2", "value3"]
        x_getSelectedValues: function () {
            var selectedValues = [];
            var values = this.getValue();
            Ext.Object.each(values, function (key, value) {
                selectedValues.push(value);
            });
            return selectedValues;
        }

    });
}

if (Ext.form.field.ComboBox) {
    Ext.override(Ext.form.field.ComboBox, {
        // Load data from local cache.
        //        mode: "local",
        //        triggerAction: "all",
        displayField: "text",
        valueField: "value",
        //tpl: "<tpl for=\".\"><div class=\"x-combo-list-item <tpl if=\"!enabled\">x-combo-list-item-disable</tpl>\">{prefix}{text}</div></tpl>",

        // These variables are in the Ext.form.ComboBox.prototype, therefore all instance will refer to the same store instance.
        //store: new Ext.data.ArrayStore({ fields: ['value', 'text', 'enabled', 'prefix'] }),

        x_setValue: function (value) {
            // value 可以是空字符串
            if (typeof (value) === 'undefined') {
                value = this.x_state['SelectedValue'];
            }
            this.setValue(value);
        },

        x_loadData: function (data) {
            data = data || this.x_state['X_Items'];
            if (data) {
                this.store.loadData(X.simulateTree.transform(data));
            }
        },


        x_getTextByValue: function (value, data) {
            data = data || this.x_state['X_Items'];
            value += ''; // 把Value转换为字符串
            for (var i = 0, count = data.length; i < count; i++) {
                var item = data[i];
                if (item[0] === value) {
                    return item[1];
                }
            }
            return '';
        }

    });
}


if (Ext.button.Button) {
    Ext.override(Ext.button.Button, {

        x_setTooltip: function () {
            this.setTooltip(this.x_state['ToolTip']);
        },

        x_toggle: function () {
            this.toggle(this.x_state['Pressed']);
        },

        x_setText: function () {
            this.setText(this.x_state['Text']);
        }


    });
}


if (Ext.grid.column.RowNumberer) {

    X.originalRowNumbererRenderer = Ext.grid.column.RowNumberer.prototype.renderer;
    Ext.override(Ext.grid.column.RowNumberer, {

        renderer: function () {

            var number = X.originalRowNumbererRenderer.apply(this, arguments);

            if (this.x_paging) {
                var pagingBar = X(this.x_paging_grid).x_getPaging();
                if (pagingBar) {
                    number += pagingBar.x_pageIndex * pagingBar.x_pageSize;
                }
            }

            return number;
        }
    });

}

/*
if (Ext.data.Store) {
    Ext.override(Ext.data.Store, {
        // true to clear all modified record information each time the store is loaded or when a record is removed (defaults to false).
        pruneModifiedRecords: true

    });
}
*/

if (Ext.grid.Panel) {
    Ext.override(Ext.grid.Panel, {

        x_getData: function () {
            var $this = this, data = this.x_state['X_Rows']['Values'];

            //////////////////////////////////////////////////
            var tpls = this.x_getTpls(this.x_tpls);

            // 将Grid1_ctl37与对应的outHTML放在哈希表中
            var tplsHash = {};
            var e = document.createElement('div');
            e.innerHTML = tpls;
            Ext.Array.each(e.childNodes, function (item, index) {
                tplsHash[item.id] = item.outerHTML.replace(/\r?\n\s*/ig, '');
            });

            // 不要改变 X_Rows -> Values 的原始数据，因为这个值会被POST到后台
            var newdata = [], newdataitem;
            Ext.Array.each(data, function (row, rowIndex) {
                newdataitem = [];
                Ext.Array.each(row, function (item, index) {
                    if (item.substr(0, 7) === "#@TPL@#") {
                        var clientId = $this.id + '_' + item.substr(7);
                        newdataitem.push('<div id="' + clientId + '_container">' + tplsHash[clientId] + '</div>');
                    } else {
                        newdataitem.push(item);
                    }
                });
                newdata.push(newdataitem);
            });
            //////////////////////////////////////////////////

            return newdata;
        },

        x_getTpls: function (paramTpls) {
            var tpls;
            if (typeof (paramTpls) !== 'undefined') {
                // 1. 如果Tpls存在于函数参数中
                tpls = paramTpls;
                this['data-last-tpls'] = tpls;
            } else {
                var tplsNode = Ext.get(this.id + '_tpls');
                if (tplsNode) {
                    // 2. 如果Tpls存在于页面节点中
                    tpls = tplsNode.dom.innerHTML;
                    // 获取模板列的内容之后，必须要删除原有的节点，因为会在表格中创建完全相同的新节点
                    tplsNode.remove();

                    // 将模板列内容保存到表格实例中
                    this['data-last-tpls'] = tpls;
                } else {
                    // 3. 从缓存中读取
                    // 从表格实例中读取模板列内容
                    tpls = this['data-last-tpls'];
                }
            }

            return tpls;
        },


        x_updateTpls: function (tpls) {
            tpls = this.x_getTpls(tpls);

            var e = document.createElement('div');
            e.innerHTML = tpls;
            Ext.Array.each(e.childNodes, function (item, index) {
                var nodeId = item.id;
                var tplContainer = Ext.get(nodeId + '_container');

                // 对于内存分页，模板列的内容可能还没有渲染到页面中
                if (tplContainer) {
                    tplContainer.dom.innerHTML = item.outerHTML;
                }
            });
        },

        x_getPaging: function () {
            var toolbar = this.getDockedItems('toolbar[dock="bottom"]');
            return toolbar.length ? toolbar[0] : undefined;
        },

        x_loadData: function () {
            var datas = this.x_getData();
            var pagingBar = this.x_getPaging();
            if (pagingBar) {
                var pagingDatas = [];
                if (pagingBar.x_databasePaging) {
                    pagingDatas = datas;
                } else {
                    for (var i = pagingBar.x_startRowIndex; i <= pagingBar.x_endRowIndex; i++) {
                        pagingDatas.push(datas[i]);
                    }
                }
                datas = pagingDatas;
            }


            var store = this.getStore();

            // 已经设置 Ext.data.Store 的 pruneModifiedRecords ，在重新加载数据时都会清除所有已经改变的数据
            // 所以无需 rejectChanges
            // 拒绝之前对表格的编辑，因为接下来就要重新加载数据
            //store.rejectChanges();

            // 重新加载数据前清空之前的改变
            //this.x_newAddedRows = [];
            //this.x_deletedRows = [];

            store.loadData(datas);

            

            this.x_initRecordIDs();

        },

        // 初始化所有记录的ID列表
        x_initRecordIDs: function () {
            var $this = this;
            this.x_recordIDs = [];
            this.getStore().each(function (record, index) {
                $this.x_recordIDs.push(record.id);
            });
        },

        // 展开所有的行扩展列
        x_expandAllRows: function () {
            var expander = this.getPlugin(this.id + '_rowexpander');
            if (expander) {
                var store = this.getStore();
                for (var i = 0, count = store.getCount() ; i < count; i++) {
                    var record = store.getAt(i);
                    if (!expander.recordsExpanded[record.internalId]) {
                        expander.toggleRow(i, record);
                    }
                }
            }
        },

        // 隐藏所有的行扩展列
        x_collapseAllRows: function () {
            var expander = this.getPlugin(this.id + '_rowexpander');
            if (expander) {
                var store = this.getStore();
                for (var i = 0, count = store.getCount() ; i < count; i++) {
                    var record = store.getAt(i);
                    if (expander.recordsExpanded[record.internalId]) {
                        expander.toggleRow(i, record);
                    }
                }
            }
        },

        // http://evilcroco.name/2010/10/making-extjs-grid-content-selectable/
        // IE下允许选中表格中的文本
        /*
        x_enableTextSelection: function () {
            var elems = Ext.DomQuery.select("div[unselectable=on]", this.el.dom);
            for (var i = 0, len = elems.length; i < len; i++) {
                Ext.get(elems[i]).set({ 'unselectable': 'off' }).removeCls('x-unselectable');
            }
        },
        */

        // 获取选中的行数，或者单元格数（单元格编辑模式）
        x_getSelectedCount: function () {
            var selectedCount = 0;
            var sm = this.getSelectionModel();
            if (sm.hasSelection()) {
                if (sm.getCount) {
                    selectedCount = sm.getCount();
                } else {
                    // 单元格编辑模式，只可能选中一个单元格
                    selectedCount = 1;
                }
            }
            return selectedCount;
        },

        // 选中某些行
        x_selectRows: function (rows) {
            rows = rows || this.x_state['SelectedRowIndexArray'] || [];
            var sm = this.getSelectionModel();
            if (sm.select) {
                sm.deselectAll(true);
                Ext.Array.each(rows, function (row, index) {
                    // select( records, [keepExisting], [suppressEvent] )
                    sm.select(row, true, true);
                });
            }
        },

        // 选中全部行
        x_selectAllRows: function() {
            var sm = this.getSelectionModel();
            if (sm.selectAll) {
                sm.selectAll(true);
            }
        },

        // 获取选中的行
        x_getSelectedRows: function () {
            var selectedRows = [];
            var sm = this.getSelectionModel();
            if (sm.getSelection) {
                var selection = sm.getSelection();
                var store = this.getStore();

                Ext.Array.each(selection, function (record, index) {
                    selectedRows.push(store.indexOf(record));
                });
            }

            return selectedRows;
        },


        // 选中单元格（AllowCellEditing）
        x_selectCell: function (cell) {
            cell = cell || this.x_state['SelectedCell'] || [];
            var sm = this.getSelectionModel();
            if (sm.select) {
                if (cell.length === 2) {
                    sm.select(cell[0], cell[1]);
                } else {
                    sm.clearSelections();
                }
            }
        },

        // 获取选中的单元格（AllowCellEditing）
        x_getSelectedCell: function () {
            var selectedCell = [];
            var sm = this.getSelectionModel();
            if (sm.getSelectedCell) {
                selectedCell = sm.getSelectedCell();
                if (!selectedCell) {
                    selectedCell = [];
                }
            }
            return selectedCell;
        },


        // 获取隐藏列的名称列表
        x_getHiddenColumns: function () {
            var hiddens = [], columns = this.columns;
            Ext.Array.each(columns, function (column, index) {
                if (column.isHidden()) {
                    hiddens.push(column.id);
                }
            });
            return hiddens;
        },

        // 隐藏需要隐藏的列，显示不需要隐藏的列
        x_updateColumnsHiddenStatus: function (hiddens) {
            hiddens = hiddens || this.x_state['HiddenColumns'] || [];
            var columns = this.columns;
            Ext.Array.each(columns, function (column, index) {
                if (hiddens.indexOf(column.id) !== -1) {
                    column.setVisible(false);
                } else {
                    column.setVisible(true);
                }
            });
        },

        // 初始化排序列头
        x_initSortHeaders: function() {
            var gridEl = Ext.get(this.id), columns = this.x_getColumns();

            // 为所有可排序列添加手型光标
            Ext.Array.each(columns, function (item, index) {
                if (item['sortable']) {
                    Ext.get(item.id).addCls('cursor-pointer');
                }
            });
        },

        // 设置表格标题栏的排序图标
        x_setSortIcon: function (sortColumnID, sortDirection) {
            var gridEl = Ext.get(this.id), columns = this.x_getColumns(), headers = gridEl.select('.x-column-header');

            // 清空所有可排序列的排序箭头
            headers.removeCls(['x-column-header-sort-DESC', 'x-column-header-sort-ASC']);

            // 为所有可排序列添加手型光标
            Ext.Array.each(columns, function (item, index) {
                if (item['sortable']) {
                    Ext.get(item.id).addCls('cursor-pointer');
                }
            });

            // 设置当前列的排序箭头
            if (sortColumnID) {
                Ext.get(sortColumnID).addCls('x-column-header-sort-' + sortDirection.toUpperCase());
            }

        },

        // 获取表格列
        x_getColumns: function () {
            /*
            var columns = [];
            var configColumns = this.getColumnModel().config;
            Ext.Array.each(configColumns, function (item, index) {
                // expander也属于表格列的一种类型，否则设置x_setSortIcon会出错
                if (item.id !== 'numberer' && item.id !== 'checker') { // && item.id !== 'expander'
                    columns.push(item);
                }
            });
            */
            return this.columns;
        },

        // 这个方法用不到了，现在对States的更新会导致Values的改变，进而促使表格的重新加载
        /*
        x_setRowStates: function (states) {
        var gridEl = Ext.get(this.id), columns = this.x_getColumns(), states = states || this.x_state['X_States'] || [];

        function setCheckBoxStates(columnIndex, stateColumnIndex) {
        var checkboxRows = gridEl.select('.x-grid-body .x-grid-row .x-grid-td-' + columns[columnIndex].id + ' .box-grid-checkbox');
        checkboxRows.each(function (row, rows, index) {
        if (states[index][stateColumnIndex]) {
        if (row.hasCls('box-grid-checkbox-unchecked-disabled')) {
        row.removeCls('box-grid-checkbox-unchecked-disabled');
        } else {
        row.removeCls('box-grid-checkbox-unchecked');
        }
        } else {
        if (row.hasCls('box-grid-checkbox-disabled')) {
        row.addCls('box-grid-checkbox-unchecked-disabled')
        } else {
        row.addCls('box-grid-checkbox-unchecked')
        }
        }
        });
        }

        var stateColumnIndex = 0;
        Ext.Array.each(columns, function (column, index) {
        if (column['x_persistState']) {
        if (column['x_persistStateType'] === 'checkbox') {
        setCheckBoxStates(index, stateColumnIndex);
        stateColumnIndex++;
        }
        }
        });
        },
        */

        // 获取列状态（目前只有CheckBoxField用到）
        x_getStates: function () {
            var gridEl = Ext.get(this.id), columns = this.x_getColumns(), states = [];

            function getCheckBoxStates(columnIndex) {
                var checkboxRows = gridEl.select('.x-grid-row .x-grid-cell-' + columns[columnIndex].id + ' .box-grid-checkbox');
                var columnStates = [];
                checkboxRows.each(function (row, index) {
                    if (row.hasCls('unchecked')) {
                        columnStates.push(false);
                    } else {
                        columnStates.push(true);
                    }
                });
                return columnStates;
            }

            Ext.Array.each(columns, function (column, index) {
                if (column['x_persistState']) {
                    if (column['x_persistStateType'] === 'checkbox') {
                        states.push(getCheckBoxStates(index));
                    }
                }
            });

            // 把列状态列表转换为行状态列表，与后台数据保持一致
            var i, resolvedStates = [], rowState, rowCount;
            if (states.length > 0) {
                rowCount = states[0].length;
                for (i = 0; i < rowCount; i++) {
                    rowState = [];
                    Ext.Array.each(states, function (state, index) {
                        rowState.push(state[i]);
                    });
                    resolvedStates.push(rowState);
                }
            }

            return resolvedStates;
        },

        // 提交客户端改变
        x_commitChanges: function () {

            this.getStore().commitChanges();

            //this.x_newAddedRows = [];
            //this.x_deletedRows = [];
            this.x_initRecordIDs();
        },

        // 从Store中删除选中的行（或者单元格）
        x_deleteSelected: function () {
            var $this = this;
            var store = this.getStore();

            var sm = this.getSelectionModel();
            if (sm.getSelections) {
                var selections = sm.getSelections();
                Ext.Array.each(selections, function (record, index) {
                    store.remove(record);
                });
            } else if (sm.getSelectedCell) {
                var selectedCell = sm.getSelectedCell();
                store.removeAt(selectedCell[0]);
            }
        },

        // 添加一条新纪录
        x_addNewRecord: function (defaultObj, appendToEnd) {
            var i, count, store = this.getStore();
            var recordType = store.recordType;
            var newRecord = new recordType(defaultObj);

            this.stopEditing();
            if (appendToEnd) {
                store.add(newRecord);

                // 新增客户端改变的行索引
                //this.x_newAddedRows.push(store.getCount() - 1);

            } else {
                store.insert(0, newRecord);

                // 新增客户端改变的行索引
                //for (i = 0, count = this.x_newAddedRows.length; i < count; i++) {
                //    this.x_newAddedRows[i]++;
                //}
                //this.x_newAddedRows.push(0);

            }
            this.startEditing(0, 0);
        },

        // 获取新增的行索引（在修改后的列表中）
        x_getNewAddedRows: function () {
            var $this = this;
            var newAddedRows = [];
            this.getStore().each(function (record, index) {
                if ($this.x_recordIDs.indexOf(record.id) < 0) {
                    newAddedRows.push(index);
                }
            });
            return newAddedRows;
        },

        // 获取删除的行索引（在原始的列表中）
        x_getDeletedRows: function () {
            var currentRecordIDs = [], deletedRows = [];
            this.getStore().each(function (record, index) {
                currentRecordIDs.push(record.id);
            });

            // 快速判断是否存在行被删除的情况
            if (currentRecordIDs.join('') === this.x_recordIDs.join('')) {
                return deletedRows;
            }

            Ext.Array.each(this.x_recordIDs, function (recordID, index) {
                if (currentRecordIDs.indexOf(recordID) < 0) {
                    deletedRows.push(index);
                }
            });
            return deletedRows;
        },

        // 获取用户修改的单元格值
        x_getModifiedData: function () {
            var i, j, count, columns = this.x_getColumns(), columnMap = {};

            Ext.Array.each(columns, function (column, index) {
                columnMap[column.id] = column;
            });

            function checkColumnEditable(columnID) {
                var column = columnMap[columnID];
                if (column && (column.editor || column.xtype === 'checkcolumn')) {
                    return true;
                }
                return false;
            }

            var modifiedRows = [];
            var store = this.getStore();
            var modifiedRecords = store.getModifiedRecords();
            var rowIndex, rowData, newData, modifiedRecord, recordID, rowIndexOriginal;
            for (i = 0, count = modifiedRecords.length; i < count; i++) {
                modifiedRecord = modifiedRecords[i];
                recordID = modifiedRecord.id;
                rowIndex = store.indexOf(modifiedRecord);
                rowData = modifiedRecord.data;
                if (rowIndex < 0) {
                    continue;
                }

                // 本行数据在原始数据集合中的行索引
                rowIndexOriginal = this.x_recordIDs.indexOf(recordID);
                if (rowIndexOriginal < 0) {
                    // 删除那些不能编辑的列
                    for (var columnID in rowData) {
                        if (!checkColumnEditable(columnID)) {
                            delete rowData[columnID];
                        }
                    }
                    // 新增数据行
                    modifiedRows.push([rowIndex, -1, rowData]);
                } else {
                    var rowModifiedObj = {};
                    for (var columnID in modifiedRecord.modified) {
                        if (checkColumnEditable(columnID)) {
                            newData = rowData[columnID];
                            rowModifiedObj[columnID] = newData;
                        }
                    }
                    // 修改现有数据行
                    modifiedRows.push([rowIndex, rowIndexOriginal, rowModifiedObj]);
                }

            }

            // 结果按照 rowIndex 升序排序
            return modifiedRows.sort(function (a, b) { return a[0] - b[0]; });
        }

    });
}


if (Ext.tree.Panel) {
    Ext.override(Ext.tree.Panel, {

        x_loadData: function () {
            var datas = this.x_state['X_Nodes'];
            var nodes = this.x_tranformData(datas);
            var root = this.getRootNode();
            if (root) {
                root.removeAll();
            }
            this.setRootNode({
                //id: this.id + '_root',
                expanded: true,
                children: nodes
            });
        },

        x_tranformData: function (datas) {
            var that = this, i = 0, nodes = [];
            for (i = 0; i < datas.length; i++) {
                var data = datas[i], node = {};

                // 0 - Text
                // 1 - Leaf
                // 2 - NodeID
                // 3 - Enabled
                // 4 - EnableCheckBox
                // 5 - Checked
                // 6 - Expanded
                // 7 - NavigateUrl
                // 8 - Target
                // 9 - href
                // 10 - Icon
                // 11 - IconUrl
                // 12 - iconUrl
                // 13 - ToolTip
                // 14 - OnClientClick
                // 15 - EnablePostBack
                // 16 - AutoPostBack
                // 17 - CommandName
                // 18 - CommandArgument
                // 19 - Nodes
                node.text = data[0];
                node.leaf = !!data[1];
                node.id = data[2];
                node.disabled = !data[3];
                if (!!data[4]) {
                    node.checked = !!data[5];
                    if (!!data[16]) {
                        node.x_autopostback = true;
                    }
                }
                if (!data[1]) {
                    node.expanded = !!data[6];
                }
                if (data[9]) {
                    node.href = data[9];
                    node.hrefTarget = data[8];
                }
                if (data[12]) {
                    node.icon = data[12];
                }
                node.qtip = data[13];

                if (data[14]) {
                    node.x_clientclick = data[14];
                }
                node.x_enablepostback = !!data[15];
                node.x_commandname = data[17];
                node.x_commandargument = data[18];
                
                if (data[19] && data[19].length > 0) {
                    node.children = that.x_tranformData(data[19]);
                }

                
                /*
                node.listeners = {};

                if (!data[3]) {
                    node.listeners.beforeclick = function () {
                        return false;
                    };
                }
                
                if (!!data[4] && !!data[17]) {
                    node.listeners.checkchange = function (node, checked) {
                        var args = 'Check$' + node.id + '$' + checked;
                        __doPostBack(that.name, args);
                    };
                }
                

                var clickScript = '';
                if (data[15]) {
                    clickScript += data[15] + ';';
                }
                if (!!data[16]) {
                    clickScript += "__doPostBack('" + that.name + "', 'Command$" + node.id + "$" + data[18] + "$" + data[19] + "');";
                }
                if (clickScript) {
                    node.listeners.click = new Function('node', clickScript);
                }


                if (data[20] && data[20].length > 0) {
                    node.children = that.x_tranformData(data[20]);
                }
                */

                nodes.push(node);
            }
            return nodes;
        },

        x_getExpandedNodes: function (nodes) {
            var i = 0, that = this, expandedNodes = [];

            for (; i < nodes.length; i++) {
                var node = nodes[i];
                if (node.isExpanded()) {
                    expandedNodes.push(node.getId());
                }
                if (node.hasChildNodes()) {
                    expandedNodes = expandedNodes.concat(that.x_getExpandedNodes(node.childNodes));
                }
            }

            return expandedNodes;
        },

        x_getCheckedNodes: function () {
            var checkedIDs = [], checkedArray = this.getChecked();
            Ext.Array.each(checkedArray, function (node, index) {
                checkedIDs.push(node.getId());
            });
            return checkedIDs;
        },

        x_getSelectedNodes: function () {
            var selectedNodeIDs = [];
            var sm = this.getSelectionModel();
            if (sm.getSelection) {
                var selection = sm.getSelection();
                
                Ext.Array.each(selection, function (node, index) {
                    selectedNodeIDs.push(node.getId());
                });
            }

            return selectedNodeIDs;
        },

        x_selectNodes: function () {
            var nodeIDs = this.x_state['SelectedNodeIDArray'] || [];
            var model = this.getSelectionModel(), store = this.getStore(), nodes = [];
            Ext.Array.each(nodeIDs, function (nodeID, index) {
                nodes.push(store.getNodeById(nodeID));
            });
            model.deselectAll(true);
            model.select(nodes);
        }


    });
}


if (Ext.PagingToolbar) {
    // We don't use this Class in current version.
    Ext.override(Ext.PagingToolbar, {

        x_hideRefresh: function () {
            var index = this.items.indexOf(this.refresh);
            this.items.get(index - 1).hide();
            this.refresh.hide();
        }

    });
}


if (Ext.tab.Panel) {
    Ext.override(Ext.tab.Panel, {

        x_autoPostBackTabsContains: function (tabId) {
            var tabs = this.x_state['X_AutoPostBackTabs'];
            return tabs.indexOf(tabId) !== -1;
        },

        x_setActiveTab: function () {
            var tabIndex = this.x_state['ActiveTabIndex'];
            this.setActiveTab(tabIndex);
        },

        x_getActiveTabIndex: function () {
            return this.items.indexOf(this.getActiveTab());
        },

        /*
        activateNextTab: function (c) {
            if (c == this.activeTab) {
                var next = this.stack.next();
                if (next) {
                    this.setActiveTab(next);
                }
                if (next = this.items.find(function (t) { return t.tabEl.style.display !== 'none'; })) {
                    // Find the first visible tab and set it active tab. 
                    this.setActiveTab(next);
                } else {
                    this.setActiveTab(null);
                }
            }
        },
        */

        hideTab: function (tabId) {
            var tab = X(tabId).tab;
            if (tab) {
                tab.hide();
            }
        },

        showTab: function (tabId) {
            var tab = X(tabId).tab;
            if (tab) {
                tab.show();
            }
        },

        addTab: function (id, url, title, closable) {
            var options = {};
            if (typeof (id) === 'string') {
                Ext.apply(options, {
                    'id': id,
                    'title': title,
                    'closable': closable,
                    'url': url
                });
            } else {
                // 如果id不是字符串，则id为对象并且只有一个参数
                Ext.apply(options, id);
            }
            Ext.apply(options, {
                'x_dynamic_added_tab': true,
                'html': '<iframe id="' + options.id + '" name="' + options.id + '" src="' + options.url + '" frameborder="0" style="height:100%;width:100%;overflow:auto;"\></iframe\>'
            });
            var tab = this.add(options);
            this.setActiveTab(tab);

            return tab;
        },

        getTab: function (tabId) {
            return X(tabId);
        },

        removeTab: function (tabId) {
            this.remove(tabId);
        }

    });
}




if (Ext.Window) {

    Ext.override(Ext.Window, {

        // 此函数为了兼容考虑，请使用 x_hide 函数
        box_hide: function () {
            this.x_hide();
        },
        box_hide_refresh: function () {
            this.x_hide_refresh();
        },
        box_hide_postback: function (argument) {
            this.x_hide_postback(argument);
        },
        box_show: function (iframeUrl, windowTitle) {
            this.x_show(iframeUrl, windowTitle);
        },


        x_hide: function () {
            X.wnd.hide(this, this.x_property_target, this.x_iframe, this.id + '_Hidden', this.x_property_guid);
        },
        x_hide_refresh: function () {
            this.x_hide();
            window.location.reload();
        },
        x_hide_postback: function (argument) {
            // 如果argument为undefined，则传入__doPostBack应为空字符串
            argument = argument || '';
            this.x_hide();
            __doPostBack(this.name, argument);
        },
        x_show: function (iframeUrl, windowTitle) {
            X.wnd.show(this, iframeUrl, windowTitle, this.x_property_left, this.x_property_top, this.x_property_position, this.id + '_Hidden');
        },

        x_maximize: function () {
            X.wnd.maximize(this, this.x_property_target, this.x_property_guid);
        },
        x_minimize: function () {
            X.wnd.minimize(this, this.x_property_target, this.x_property_guid);
        },
        x_restore: function () {
            X.wnd.restore(this, this.x_property_target, this.x_property_guid);
        }

    });
}



if (Ext.grid.plugin.RowExpander) {
    Ext.override(Ext.grid.plugin.RowExpander, {

        // 将行扩展列的 td CSS类改为 x-grid-cell-row-expander
        getHeaderConfig: function () {
            var config = this.callParent(arguments);
            config.tdCls = Ext.baseCSSPrefix + 'grid-cell-row-expander';
            return config;
        }

    });
}

// 修正IE7下，窗口出现滚动条时，点击Window控件标题栏有时node为null的问题
/*
if (Ext.dd.DragDrop) {
    X.originalIsValidHandleChild = Ext.dd.DragDrop.prototype.isValidHandleChild;
    Ext.dd.DragDrop.prototype.isValidHandleChild = function (node) {
        if (!node || !node.nodeName) {
            return false;
        }
        return X.originalIsValidHandleChild.apply(this, [node]);
    };
}
*/


// 修正在IE下，Grid的模版列中出现文本输入框或者下拉列表时，第一次不能选中的问题
// 已经有网友发现这个问题：http://www.sencha.com/forum/archive/index.php/t-49653.html
// This is what caused my self-rendered-Html-Elements to "flicker" as described in my other thread. 
// The Dropdown receives the Click, opens and stays open for the Millisecond until
// Ext calls back and gives focus to the Cell, causing my Drop-Down to close again.
/*
if (Ext.grid.GridPanel) {
    Ext.grid.GridView.prototype.focusCell = function (row, col, hscroll) {
        this.syncFocusEl(this.ensureVisible(row, col, hscroll));

        var focusEl = this.focusEl;

        focusEl.focus();
    };
}
*/

// 修正Chrome下多表头样式错位
// 增加 !Ext.isChrome 的判断，在Chrome下DIV的宽度不包括边框的宽度
/*
if (Ext.ux.grid && Ext.ux.grid.ColumnHeaderGroup) {
    Ext.ux.grid.ColumnHeaderGroup.prototype.getGroupStyle = function (group, gcol) {
        var width = 0, hidden = true;
        for (var i = gcol, len = gcol + group.colspan; i < len; i++) {
            if (!this.cm.isHidden(i)) {
                var cw = this.cm.getColumnWidth(i);
                if (typeof cw == 'number') {
                    width += cw;
                }
                hidden = false;
            }
        }
        return {
            width: (Ext.isBorderBox || (Ext.isWebKit && !Ext.isSafari2 && !Ext.isChrome) ? width : Math.max(width - this.borderWidth, 0)) + 'px',
            hidden: hidden
        };
    };
}
*/



// 修正IE7/IE8下Date.parse('2015-10-01')出错的问题
// http://jibbering.com/faq/#parseDate
/*
(function () {
    function parseISO8601(dateStr) {
        var isoExp = /(\d{2,4})-(\d\d?)-(\d\d?)/,
       date = new Date(NaN), month,
       parts = isoExp.exec(dateStr);

        if (parts) {
            month = +parts[2];
            date.setFullYear(parts[1], month - 1, parts[3]);
            if (month != date.getMonth() + 1) {
                date.setTime(NaN);
            }
        }
        return date;
    }

	var originalParse = Date.parse;
    Date.parse = function (dateStr) {
        var date = originalParse(dateStr);
        if (isNaN(date)) {
            date = parseISO8601(dateStr);
        }
        return date;
    }

})();
*/
