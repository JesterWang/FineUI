

Ext.define('Ext.ux.SimplePagingToolbar', {
    extend: 'Ext.toolbar.Paging',

    // Override parent
    initComponent: function () {
        var me = this;

        me.store = Ext.Object.merge({}, me.store, {
            getCount: function () {
                return me.x_recordCount;
            },
            currentPage: me.x_pageIndex + 1
        });

        me.callParent();
    },

    // Override parent
    getPagingItems: function() {
        var items = this.callParent();
        // Remove refresh and separator items.
        return items.slice(0, items.length - 2);
    },

    // Override parent
    getPageData: function () {
        var fromRecord = 0, toRecord = 0;
        if (this.x_databasePaging) {
            fromRecord = (this.x_pageIndex * this.x_pageSize) + 1;
            toRecord = fromRecord + this.x_pageSize - 1;
        } else {
            fromRecord = this.x_startRowIndex + 1;
            toRecord = this.x_endRowIndex + 1;
        }
        if (toRecord > this.x_recordCount) {
            toRecord = this.x_recordCount;
        }

        return {
            total: this.x_recordCount,
            currentPage: this.x_pageIndex + 1,
            pageCount: this.x_pageCount <= 0 ? 1 : this.x_pageCount,
            fromRecord: fromRecord,
            toRecord: toRecord
        };
    },

    x_update: function (configs) {
        Ext.Object.merge(this, configs);
        this.store.currentPage = this.x_pageIndex + 1;
        this.onLoad();
    }

});
