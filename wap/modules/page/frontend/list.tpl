<h3 class="page-title">{{$title}}</h3>

<ul id="list">
    {{foreach from=$list key="key" item="item"}}
    <li class="level-{{$item.page_level}}"><a href="{{$BASE_URL}}{{$item.page_post_slug}}">{{$item.page_title}}</a></li>
    {{/foreach}}
</ul>