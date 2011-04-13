do ($ = jQuery) ->
  $.fn.values = -> 
    new FormMapper(this).asValues()
    
  $.fn.inputs = -> 
    new FormMapper(this).asInputs()