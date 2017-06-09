`import DS from "ember-data"`

secretCodeModel = DS.Model.extend
  name: DS.attr('string')
  createdAt: DS.attr('date')
  user: DS.belongsTo('user', {async: true})

`export default secretCodeModel`
