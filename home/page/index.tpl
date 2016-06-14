{extends file="./layout.tpl"}
{block name="block_head_static"}
    {* 模板中加载静态资源 *}
    {require name="home:static/lib/css/bootstrap.css"}
    {require name="home:static/lib/css/bootstrap-responsive.css"}
{/block}
{block name="content"}

    <div id="wrapper">
        {pagelet id="sidebar"}
            {$nav_index = $smarty.get.nav|default:0}
            {* 通过widget插件加载模块化页面片段，name属性对应文件路径,模块名:文件目录路径 *}
            {widget
                name="home:widget/sidebar/sidebar.tpl" 
                data=$docs
            }
            {require name="home:static/lib/js/jquery-1.10.1.js"}
            {script}
                {* $('html').toggleClass('expanded'); *}
                $('#sidebar').hover(function() {
                    require.defer(['/widget/sidebar/sidebar.async.js'], function(sidebar){
                        sidebar.run();
                    });
                });
            {/script}
        {/pagelet}

        {pagelet id="container" her-renderMode="server"}
            <a id="forkme_banner" target="_blank" href="{$github}">View on GitHub</a>

            {pagelet her-renderMode="server" id="core"}
                {widget name="home:widget/slogan/slogan.tpl"}
                {widget
                    name="home:widget/section/section.tpl"
                    method="section"
                    doc=$docs[0].doc index=$nav_index wiki=$docs[0].wiki
                }
            {/pagelet}

            {pagelet her-renderMode="lazy" id="nonCore"}
            {foreach array_slice($docs, 1) as $doc}
                {widget
                    name="home:widget/section/section.tpl"
                    method="section"
                    doc=$doc.doc index=$nav_index wiki=$doc.wiki
                }
            {/foreach}
            {/pagelet}
        {/pagelet}
    </div>
    {require name="home:static/index/index.less"}

    {* 启用emulator监控页面点击实现局部刷新 *}
    {* require.defer会在DomReady之后执行 *}
    {* {script}
        
        require.defer(["home:widget/js-helper/pageEmulator.js"],function(emulator){
            emulator.start();
        });
    {/script} *}
    <script runat="server">
        if(BigPipe.lazyPagelets && BigPipe.lazyPagelets.length > 0) {
            require.defer([], function() {
                BigPipe.fetch(BigPipe.lazyPagelets);
            });
        }
    </script>
    {* {script}
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          hm.src = "//hm.baidu.com/hm.js?ab6cd754962e109e24b0bcef3f05c34f";
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();
    {/script} *}
{/block}