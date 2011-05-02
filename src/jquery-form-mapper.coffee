do ($ = jQuery) ->
  $.fn.values = -> 
    new FormMapper(this).values()
    
  $.fn.inputs = -> 
    new FormMapper(this).inputs()