module SnippetsHelper
  def active_snippet?(snippet)
    if snippet.token?
      raw "<li class='list-group-item'>#{snippet.content.split[0...15].join(' ')}</li>"
    else
      link_to snippet.content.split[0...15].join(' '), snippet, class: 'list-group-item'
    end
  end

  def snippet_share(snippet)
    if snippet.token?
      text_field_tag :url, snippet_url(snippet.token), class: 'form-control'
    else
      text_field_tag :url, snippet_url(snippet), class: 'form-control'
    end
  end
end
