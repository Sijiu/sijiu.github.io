<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta name="author" content="{{ site.meta.author.name }}"/>
    <meta name="keywords" content="{{ page.tags | join: ',' }}"/>
    <meta name="baidu-site-verification" content="plbmWis5PB" />
    <title>{{ site.name }}{% if page.title %} / {{ page.title }}{% endif %}</title>
    <link href="http://{{ site.host }}/feed.xml" rel="alternate" title="{{ site.name }}" type="application/atom+xml"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/site.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/code/github.css"/>
    {% for style in page.styles %}
    <link rel="stylesheet" type="text/css" href="{{ style }}"/>
    {% endfor %}
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.css">
    <script src="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.min.js"></script>

<!--    <script src="https://tajs.qq.com/stats?sId=66563283"></script>-->
    <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?af402803ce98fb2abc371053df40514d";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

</head>

<body class="{{ page.pageClass }}">

<div class="main">
    {{ content }}

    <footer>
        {% include gitalk.tpl %}
        <p>&copy; Since <span id="year"></span> Plain V2.0
            <span id="busuanzi_container_page_pv" title="浏览量">  👀 <span id="busuanzi_value_page_pv"></span></span>
        </p>

    </footer>


</div>

<aside>
<!--    <img align="middle" src="/image/lovelife.jpg" style="width: 300px; height: 170px;" alt="love life">-->
    <H1 style="color:#ed9292; background-image: linear-gradient(to right, #2a333c, #83898e, #2a333c);
    font-size: 16px;margin-top: 20px;">
        Now or Never
        <a href="/feed.xml" class="feed-link" title="Subscribe">
        <img src="/image/RSS.png" alt="RSS feed"/></a>
        <a href="https://github.com/{{ site.meta.author.github }}">
        <img src="/image/github_72px.png" alt="Look me on GitHub"></a>
        <a href="https://gitee.com/mplain/mplain/pages">
            <img src="/image/gitee.ico" alt="Gitee pages" style="height: 15px;"></a>
        </a>
    </H1>

    <nav class="block">
        <i class="icon-large icon-folder-open"></i>
        <span><a href="/">{{ site.posts | size }}</a></span>
        <ul>
            {% for category in site.custom.categories %}
                {% assign name = category.name %}
                {% if site.custom.hide contains name %}
                {% else %}
                <li class="{{ name }}" ><a href="/category/{{ name }}/">
                    {{ category.title }} <span></span></a></li>
                {% endif %}
            {% endfor %}
            <li class="world"><a href="/world/" >真彩世界<span></span></a></li>
        </ul>
    </nav>

    <div id="search-container">
        <input type="text" id="search-input" placeholder="搜索一下下">
        <ul id="results-container"></ul>
    </div>

    <div class="block block-about">
        <h3>关于</h3>
        <figure>
            <img src="/favicon.ico" style="width: 60px;"/>
            <p><strong>{{ site.meta.author.name }}</strong></p>
        </figure>
        <p>值得一做的事, 都值得做好!</p>
        <!--<p>Find me：mxh403@163.com</p>-->
    </div>

    <div class="block block-tags">
        {% unless site.tags == empty %}
        <ul class="tags_list">
            <li> <i class="icon-large icon-tags"></i>
                <span><a href="/tags.html">{{ site.tags | size }}</a></span>
            </li>
            {% assign tags_list = site.tags %}
            {% include tags_list.tpl %}
        </ul>
        {% endunless %}
    </div>

    <div class="block block-license">
        <p style="display: inline-block;">
            <a rel="license" href="http://creativecommons.org/licenses/by/4.0/" target="_blank"
               class="hide-target-icon" title="Copyright declaration of site content">
                <b>Copyright</b><img alt="知识共享许可协议" src="/image/by_nc88x31.png"/>
        </a></p>
    </div>


    <div class="block block-thank">
        <h3>Powered by <a href="https://sijiu.github.io/" target="_blank">Plain</a></h3>
        <h3>Based on <a href="https://github.com/mytharcher/SimpleGray" target="_blank">SimpleGray</a></h3>
        <h3>Thank for <a href="http://cxlcym.github.io/" target="_blank">Cao xilong</a></h3>
        <h3>Thank for <a href="http://yanjunyi.com/discovery/" target="_blank">严俊羿</a></h3>
    </div>
    <span id="busuanzi_container_site_pv" style="color: #999">本站总访问量：<span id="busuanzi_value_site_pv"></span> 次</span>
    <span id="busuanzi_container_site_uv" style="color: #999"> ✍ 访客数：<span id="busuanzi_value_site_uv"></span> 人次</span>


</aside>
<!--<script src="https://tajs.qq.com/stats?sId=66563283"></script>-->
<!--<script src="https://elfjs.googlecode.com/files/elf-0.4.1-min.js"></script>-->

<script src="/assets/js/site.js"></script>

<script src="/assets/js/feature.js"></script>
{% for script in page.scripts %}
<script src="{{ script }}"></script>
{% endfor %}
<script type="text/javascript">
    let categoryCount = function(){
    let count = {
        {% for category in site.categories %}
            {% assign name = category | first %}
            {% assign count = category | last | size %}
        {{ name }}: {{ count }},
        {% endfor%}
    }
    console.log("===", count, JSON.stringify(count))
    let li_arr = document.querySelectorAll("nav li").toArray();
    li_arr.forEach(el => {
        let cat = el.getAttribute("class")
        if(cat){
            el.querySelector("span").textContent = count[cat]
        }
    })
}
categoryCount();
</script>
<script src="/assets/js/simple-jekyll-search.min.js"></script>
<script type="text/javascript">
    SimpleJekyllSearch({
        searchInput: document.getElementById('search-input'),
        resultsContainer: document.getElementById('results-container'),
        json: '/search.json',
        searchResultTemplate: '<li><a href="{url}" title="{desc}">{title}</a></li>', // 文章列表模板
        noResultsText: '没有搜索到文章', // 无搜索数据提示语
        limit: 20, // 返回最大文章数
        fuzzy: false // 是否模糊匹配
    })

</script>


</body>
</html>
