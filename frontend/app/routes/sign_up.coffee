`import Ember from 'ember'`

signUpRoute = Ember.Route.extend
  model: ->
   []

  setupController: (controller,model)->
    controller.set('model', model)

   actions:
    signup: ->
      if Ember.isEqual(@controller.get('password'), @controller.get('confirmPassword'))
        userObj = {
          firstname: @controller.get('firstname')
          lastname: @controller.get('lastname')
          email: @controller.get('email')
          contactNumber: @controller.get('contactNumber')
          password: @controller.get('password')
          confirmPassword: @controller.get('confirmPassword')
        }
        userRec = @store.createRecord('user', userObj)
        userRec.save().then((response)=>
          debugger
        )
       else
        alert("Password do not match")


`export default signUpRoute`
