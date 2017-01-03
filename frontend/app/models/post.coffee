`import DS from "ember-data"`

postModel = DS.Model.extend
  title: DS.attr('string')
  description: DS.attr('string')
  completed: DS.attr('boolean')
  createdAt: DS.attr('date')
  user: DS.belongsTo('user', {async: true})

`export default postModel`
