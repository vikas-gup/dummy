`import Ember from 'ember'`

signUpRoute = Ember.Route.extend
  beforeModel: ->
    if Ember.isPresent(@get('session.user'))
      @transitionTo('home')
    else
      @transitionTo('sign_up')

  model: ->
    @store.query('secret-code', {unutilized: true})

  setupController: (controller,model)->
    controller.set('secretCodeList', model)

   actions:
    signup: ->
      if Ember.isEqual(@controller.get('password'), @controller.get('confirmPassword')) and Ember.isPresent(@controller.get('selectedSecret'))
        userObj = {
          firstname: @controller.get('firstname')
          lastname: @controller.get('lastname')
          email: @controller.get('email')
          password: @controller.get('password')
          confirmPassword: @controller.get('confirmPassword')
        }
        userRec = @store.createRecord('user', userObj)
        userRec.save().then((response)=>
          alert "User Created"
          if Ember.isPresent(response)
            @get('session').set('user', response)
            @store.findRecord('secret-code', @controller.get('selectedSecret.id')).then ((secretCode) =>
              secretCode.set('user', response)
              debugger
              secretCode.save()
            )
            @transitionTo('home')
        )
       else
        alert("Password do not match")


`export default signUpRoute`
