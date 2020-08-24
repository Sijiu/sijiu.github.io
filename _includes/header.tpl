<header>
	<h1>{% if page.title %}<a href="/" class="minor">{{ site.name }}</a> / {{ page.title }}{% else %}{{ site.name }}{% endif %}</h1>
	{% unless page.title %}<p class="additional">{{ site.blog.desc }}</p>{% endunless %}
</header>
