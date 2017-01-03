`import Ember from 'ember'`

signUpRoute = Ember.Route.extend
  beforeModel: ->
    if Ember.isPresent(@get('session.user'))
      @transitionTo('home')
    else
      @transitionTo('sign_up')

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
          username: @controller.get('username')
          password: @controller.get('password')
          confirmPassword: @controller.get('confirmPassword')
        }
        userRec = @store.createRecord('user', userObj)
        userRec.save().then((response)=>
          alert "User Created"
          if Ember.isPresent(response)
            @get('session').set('user', response)
            @transitionTo('home')
        )
       else
        alert("Password do not match")


`export default signUpRoute`
