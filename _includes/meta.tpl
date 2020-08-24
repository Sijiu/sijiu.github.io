<p class="meta">
    <span class="datetime">{{ post.date | date: "%Y-%m-%d" }}</span>
	 &nbsp;&nbsp;<i class="icon-folder-open"></i><a href="/category/{{ post.category }}"
				  class="{{ post.category }}">{{ site.custom.category[post.category] }}</a>
    {% if post.tags.size > 0 %}
        &nbsp;&nbsp;<i class="icon-tags"></i>
        {% for tag in post.tags %}
        <a href="/tags#{{ tag }}-ref" class="tag"> {{ tag }} </a>
        {% endfor %}
    {% endif %}
    {% if page.url contains "posts" %}
        {% assign en = page.content | number_of_words %}
        {% assign zh = content | strip_html | strip_newlines | split: "" | size %}
        {% assign ch =  en | plus: zh %}
        {% assign read = ch | divided_by: 400 %}
        <span style="margin-left: 20px;">约 {{ ch }} 字 ⏰ 阅读需 {{ read }} 分钟</span>
    {% endif %}
</p>