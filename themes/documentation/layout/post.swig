<!DOCTYPE html>
<html>
<head>
  <meta charSet='utf-8' />
  <title>{{config.title + ' - ' + page.title}}</title>
  <link href='https://cdnjs.cloudflare.com/ajax/libs/normalize/4.0.0/normalize.min.css' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,300,700' rel='stylesheet' type='text/css'>
  <link href='{{ url_for("css/docs.css") }}' rel='stylesheet'>
  
</head>
<body>
  <div class='menu'>
    <div class='logo'>
    </div>


  
    <nav class='menu-nav'>
      {% for section in site.data.nav %}
        <ul class='nav'>
          <span>{{ section.title }}</span>
          <ul class='nav'>
            {% for item in section.items %}
              <li>
                <a href='{{item.href || url_for(item.id + ".html") }}'{% if item.id == page.id %} class='active'{% endif %}>{{item.title}}</a>
              </li>
            {% endfor %}
          </ul>
        </ul>
      {% endfor %}
    </nav>
    <a class='footer' href='https://github.com/aceld/zinx'>
      ZINX on github
    </a>
  </div>
  <div class='page'>
    <div class="header-label">
    <li class="menu-item">
            <iframe src="https://ghbtns.com/github-btn.html?user=aceld&repo=zinx&type=star&count=true&size=large&v=3" frameborder="0" scrolling="0" width="150px" height="30px"></iframe>
    </li>
    <li class="menu-item">
            <iframe src="https://ghbtns.com/github-btn.html?user=aceld&repo=zinx&type=fork&count=true&size=large&v=2" frameborder="0" scrolling="0" width="150px" height="30px"></iframe>
    </li>
    </div>
    <div class='page-content'>
      <h1>{{page.title}}</h1>
      {{page.content}}
    </div>
  </div>
  <div class='switch-page'>
    {% if page.prev %}
      <a class='previous' href='{{ url_for(page.prev) }}'>Previous</a>
    {% endif %}
    {% if page.next %}
      <a class='next' href='{{ url_for(page.next) }}'>Next</a>
    {% endif %}
  </div>
</body>
</html>
