class BlueprintLinkRenderer < WillPaginate::LinkRenderer
  def to_html
    links = @options[:page_links] ? windowed_links : []
    links.unshift(page_link_or_span(@collection.previous_page, 'previous', @options[:previous_label]))
    links.push(page_link_or_span(@collection.next_page, 'next', @options[:next_label]))
    html = links.join(@options[:separator])
    @options[:container] ? @template.content_tag('page-navigator',
                              @template.content_tag('page-info',
                                @template.content_tag('current-page', @collection.current_page) <<
                                @template.content_tag('page-count', @collection.total_pages)) <<
                              html, nil) : html
  end


  protected

  def windowed_links
    visible_page_numbers.map { |n| page_link_or_span(n, (n == current_page ? 'current' : nil)) }
  end

  def page_link_or_span(page, span_class, text = nil)
    text ||= page.to_s
    if page && page != current_page
      page_link(page, text, :class => span_class)
    else
      page_span(page, text, :class => span_class)
    end
  end


  def page_link(page, text, attributes = {})
    if text == @options[:previous_label]
      return @template.content_tag(:prev, @template.content_tag(:label, text) <<
                                          @template.content_tag('load-page', nil, {:event => 'activate', :page => url_for(page)}), nil)
    end
    if text == @options[:next_label]
      return @template.content_tag(:next, @template.content_tag(:label, text) <<
                                          @template.content_tag('load-page', nil, {:event => 'activate', :page => url_for(page)}), nil)

    end
  end

  def page_span(page, text, attributes = {})

    if text == @options[:previous_label]
      return @template.content_tag(:prev, @template.content_tag(:label, text), nil)
    end
    if text == @options[:next_label]
      return @template.content_tag(:next, @template.content_tag(:label, text), nil)
    end


  end
end