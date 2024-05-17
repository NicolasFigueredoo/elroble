<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>El Roble</title>
        <link rel="icon" href="{{ asset('img/LogoRobl.png') }}">

        @vite('resources/css/app.css')
        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/summernote/dist/summernote-bs4.css" rel="stylesheet">

    </head>
    <body class="font-sans antialiased dark:bg-black dark:text-white/50">
    <div id="app"></div>

    @vite('resources/js/app.js')

    </body>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src="https://www.google.com/recaptcha/api.js?render=6LfXCt8pAAAAAJ988vWMQzCeZ6rm8hZOZk1u95KU"></script>

</html>
