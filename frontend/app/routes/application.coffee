`import Ember from 'ember'`

applicationRoute = Ember.Route.extend
  beforeModel: ->
    return Ember.RSVP.Promise.all([@getLoggedInUser()])
#    if Ember.isPresent(@get('session.user'))
#      @transitionTo('home')
#    else
#      @transitionTo('sign_in')

  getLoggedInUser:()->
    that = this
    $.ajax(
      type: 'GET'
      url: '/looged_in_user'
    ).then((data) =>
      if data['message'] != 'Nobody logged In'
        that.store.find('user', data.user.id).then((user)=>
          that.get('session').set('user',user)
        )
    )

`export default applicationRoute`
