<div class="container">
    <div class="label label-warning"><%= flash[:notice] %></div>
  	<div class="navbar navbar-default">
      <% if current_user %>
        <%= "Logged in as #{current_user.email}" %> | 
        <%= link_to "Sign Out", destroy_user_session_path, method: :delete %>
      <% end %>
    </div>
