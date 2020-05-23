<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Juri Login</title>
    <link rel="stylesheet" href="{{ asset('css/login.css') }}" />
  </head>
  <body>
    <div id="card">
      <div id="card-content">
        <!-- Tittle -->
        <div id="card-title">
          <h2>Juri Login</h2>
          <div class="underline-title"></div>
          @if ($status = Session::get('status'))
              {{ $status }}
          @endif
        </div>
        <!-- form -->
        <form method="post" class="form" action="{{ route('login.post') }}">
          @csrf
          <!-- username -->
          <input
            id="username"
            type="text"
            name="username"
            placeholder="username"
            value="{{ old('username') }}"
          />
          <!-- password -->
          <input
            id="password"
            type="password"
            name="password"
            placeholder="password"
          />
          <!-- submit -->
          <input type="submit" value="Sign in" />
          <a href="{{ route('login.index.admin') }}" id="option">Sign in as Admin</a>
        </form>
        <!--  -->
      </div>
    </div>
  </body>
</html>
