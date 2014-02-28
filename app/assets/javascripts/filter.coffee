class GlobalSearch
  $search_div =   "[data-role='list-search']"
  $search_field = "[data-role='search-field']"

  constructor: (term_length)->
    @term_length = term_length
    @_search()

  _search: ->
    term_length = @term_length
    $("#{$search_div}").find('input.search').keyup ->
      terms = $(this).val().toLowerCase()
      if terms.length >= term_length
        $('ul.list li').each ->
          $(@).find("#{$search_field}").each ->
            if($(@).text().toLowerCase().indexOf(terms)!= -1)
              $(@).show()
              $(@).parent('li').show()
            else
              $(@).hide()
          if($(@).find("#{$search_field}:visible").length is 0)
            $(@).hide()
      else
        $('ul.list li').each ->
          $(@).show()
          $(@).find("#{$search_field}").each ->
            $(@).show()

$('document').ready(new GlobalSearch(3))
