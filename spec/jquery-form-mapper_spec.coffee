describe "FormMapper JQuery plugin", () ->
  beforeEach () ->
    @form = $("form")
  
  describe "as Values", () ->
    beforeEach () ->
      @data = @form.values()
    
    it "should load root property", () ->
      expect(@data.root.root_property).toEqual "root property value"
      
    it "should load nested property", () ->
      expect(@data.root.nested.nested_property).toEqual "nested property value"
     
    it "should load the checked value of radio", () ->
      expect(@data.root.radio).toEqual "checked radio"

  describe "as Inputs", () ->
    beforeEach () ->
      @data = @form.inputs()

    it "should load root property", () ->
      expect(@data.root.root_property).toBe "#root-input"
      
    it "should load nested property", () ->
      expect(@data.root.nested.nested_property).toBe "#nested-input"  