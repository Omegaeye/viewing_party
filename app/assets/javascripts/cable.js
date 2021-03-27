// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);

// <% current_user.friendships.each do |friend| %>
//     <%= form.label :friends, friend.friend.username %>
//     <%= form.check_box :friends, value: friend.friend.id, {multiple: true} id: "friends#{friend.friend.id}" %>
// <% end %><br>
