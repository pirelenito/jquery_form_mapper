class FormMapper
  constructor: (formObject) ->
    @formObject = formObject
    
  asValues: ->
    @map(false)
    
  asInputs: ->
    @map(true)
  
  map: (valueAsInputs)->
    object = {}
    for input in @formObject.children "input"
      continue if $(input).is("input[type='radio']") and !$(input).is(":checked")
      propertyNames = input.name.match(/\w+/g) || []
      value = if valueAsInputs then $(input) else $(input).val()
      @setProperty(object, propertyNames, value) if (propertyNames.length > 0)
    return object
  
  setProperty: (object, propertyNames, value, depth=0) ->
    name = propertyNames[depth].replace("_attributes", "")
    if depth == (propertyNames.length-1)
      object[name] = value
    else
      object[name] = {} unless object[name] 
      @setProperty object[name], propertyNames, value, (depth+1)
    