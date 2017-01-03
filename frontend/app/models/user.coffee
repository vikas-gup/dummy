`import DS from "ember-data"`

userModel = DS.Model.extend
  firstname: DS.attr('string')
  lastname: DS.attr('string')
  email: DS.attr('string')
  contactNumber: DS.attr('number')
  username: DS.attr('string')
  password: DS.attr('string')
  name: (->
    this.get('firstname') + ' ' + this.get('lastname')
  ).property('firstname', 'lastname')
  posts: DS.hasMany('post')

`export default userModel`
