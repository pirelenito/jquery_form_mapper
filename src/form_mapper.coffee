class FormMapper
  constructor: (formObject) ->
    @formObject = formObject
    
  values: ->
    @crawl (input) ->
      $(input).val()
    
  inputs: ->
    @crawl (input) ->
      $(input)
  
  crawl: (map) ->
    object = {}
    for input in @formObject.find "input"
      @setProperty(object, @propertyNames(input), map(input)) if @shouldRead input 
    return object

  shouldRead: (input) ->
    not $(input).is("input[type='radio']") or
    $(input).is("input[type='radio']") and $(input).is(":checked")
    
  propertyNames: (input) ->
    for name in (input.name.match(/\w+/g) || [])
      name.replace "_attributes", ""
  
  setProperty: (object, propertyNames, value, depth=0) ->  
    return unless propertyNames.length > 0
    name = propertyNames[depth]
    
    if depth >= (propertyNames.length-1)
      object[name] = value
    else
      object[name] = {} unless object[name] 
      @setProperty object[name], propertyNames, value, (depth+1)
    