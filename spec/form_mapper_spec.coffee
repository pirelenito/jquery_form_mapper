describe "FormMapper", () ->
  beforeEach () ->
    @mapper = new FormMapper $("form")
  
  describe "as Values", () ->
    beforeEach () ->
      @data = @mapper.asValues()
    
    it "should load root property", () ->
      expect(@data.root.root_property).toEqual "root property value"
      
    it "should load nested property", () ->
      expect(@data.root.nested.nested_property).toEqual "nested property value"
     
    it "should load the checked value of radio", () ->
      expect(@data.root.radio).toEqual "checked radio"
      
    it "should load property within a div", () ->
      expect(@data.root.within_div).toEqual "input within div value"
  

  describe "as Inputs", () ->
    beforeEach () ->
      @data = @mapper.asInputs()

    it "should load root property", () ->
      expect(@data.root.root_property).toBe "#root-input"
      
    it "should load nested property", () ->
      expect(@data.root.nested.nested_property).toBe "#nested-input"
    