{
  Resource: {  
    local it = self,

    type:: 'AbstractResource',
    name:: 'default',
    content:: {},

    local _type = it.type,
    local _content = it.content,
    local _name = it.name,    

    resource: [{
      [_type]: {
        [_name]: _content
      }
    }],

  }
}