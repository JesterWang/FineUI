

mkdir ..\extjs
mkdir ..\extjs\src
mkdir ..\extjs\lang
mkdir ..\extjs\res
mkdir ..\extjs\res\images
mkdir ..\extjs\res\css
mkdir ..\extjs\res\ext-theme-access
mkdir ..\extjs\res\ext-theme-access\images
mkdir ..\extjs\res\ext-theme-classic
mkdir ..\extjs\res\ext-theme-classic\images
mkdir ..\extjs\res\ext-theme-gray
mkdir ..\extjs\res\ext-theme-gray\images
mkdir ..\extjs\res\ext-theme-neptune
mkdir ..\extjs\res\ext-theme-neptune\images


type res\FineUI.css > _x
type res\PageLoading.css >> _x
type res\Grid.css >> _x
type res\Tree.css >> _x
ajaxminifier\ajaxminifier -css _x -o ..\extjs\res\css\ux.css

type extjs_source_all\resources\ext-theme-access\ext-theme-access-all.css > _x
type ..\extjs\res\css\ux.css >> _x
type res\access.css >> _x
ajaxminifier\ajaxminifier -css _x -o ..\extjs\res\ext-theme-access\all.css

type extjs_source_all\resources\ext-theme-classic\ext-theme-classic-all.css > _x
type ..\extjs\res\css\ux.css >> _x
type res\classic.css >> _x
ajaxminifier\ajaxminifier -css _x -o ..\extjs\res\ext-theme-classic\all.css

type extjs_source_all\resources\ext-theme-gray\ext-theme-gray-all.css > _x
type ..\extjs\res\css\ux.css >> _x
type res\gray.css >> _x
ajaxminifier\ajaxminifier -css _x -o ..\extjs\res\ext-theme-gray\all.css

type extjs_source_all\resources\ext-theme-neptune\ext-theme-neptune-all.css > _x
type ..\extjs\res\css\ux.css >> _x
type res\neptune.css >> _x
ajaxminifier\ajaxminifier -css _x -o ..\extjs\res\ext-theme-neptune\all.css





type extjs_source_all\locale\ext-lang-en.js > _x
type js\lang\fineui-lang-en.js >> _x
ajaxminifier\ajaxminifier -js -evals:immediate  _x -o ..\extjs\lang\en.js

type extjs_source_all\locale\ext-lang-pt_BR.js > _x
type js\lang\fineui-lang-pt_BR.js >> _x
ajaxminifier\ajaxminifier -js -evals:immediate  _x -o ..\extjs\lang\pt_BR.js


type extjs_source_all\locale\ext-lang-tr.js > _x
type js\lang\fineui-lang-tr.js >> _x
ajaxminifier\ajaxminifier -js -evals:immediate  _x -o ..\extjs\lang\tr.js


type extjs_source_all\locale\ext-lang-zh_CN.js > _x
type js\lang\fineui-lang-zh_CN.js >> _x
ajaxminifier\ajaxminifier -js -evals:immediate  _x -o ..\extjs\lang\zh_CN.js


type extjs_source_all\locale\ext-lang-zh_TW.js > _x
type js\lang\fineui-lang-zh_TW.js >> _x
ajaxminifier\ajaxminifier -js -evals:immediate  _x -o ..\extjs\lang\zh_TW.js


type extjs_source_all\locale\ext-lang-ru.js > _x
type js\lang\fineui-lang-ru.js >> _x
ajaxminifier\ajaxminifier -js -evals:immediate  _x -o ..\extjs\lang\ru.js












type extjs_source_all\ext-all.js > _x

type _x > ..\extjs\ext-part1.js


type js\lib\json2.js > _x
type js\lib\Base64.js >> _x
type js\X\X.util.js >> _x
type js\X\X.ajax.js >> _x
type js\X\X.wnd.js >> _x
type js\X\extender.js >> _x
type js\X\X.simulateTree.js >> _x
type js\X\X.format.js >> _x
type js\ux\FormViewport.js >> _x
type js\ux\SimplePagingToolbar.js >> _x
type js\ux\TabCloseMenu.js >> _x
type extjs_source_all\examples\ux\RowExpander.js >> _x

type _x > ..\extjs\ext-part2.js


type ..\extjs\ext-part1.js > _x
type ..\extjs\ext-part2.js >> _x


ajaxminifier\ajaxminifier -js -evals:immediate  _x -o ..\extjs\ext-all.js


ajaxminifier\ajaxminifier -js -evals:immediate  extjs_source_all\ext-debug.js -o ..\extjs\ext.js

type extjs_source_all\ext-theme-neptune.js > ..\extjs\ext-theme-neptune.js


del _x /Q

