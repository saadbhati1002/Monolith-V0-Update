<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>
    </title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">

    <style>
        .body532 blockquote {
            border-left: 5px solid #ccc;
            font-style: italic;
            margin-left: 0;
            margin-right: 0;
            overflow: hidden;
            padding-left: 1.5em;
            padding-right: 1.5em;
        }
    </style>
</head>

<body style="font-family: 'Poppins', Arial, sans-serif">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="center" style="padding: 20px;">
                <table class="content" width="600" border="0" cellspacing="0" cellpadding="0"
                    style="border-collapse: collapse; border: 1px solid #cccccc;">
                    <!-- Header -->
                    <tr>
                        <td class="header"
                            style="background-color: #345C72; padding: 40px; text-align: center; color: white; font-size: 24px;">
                            <img src="{{ asset(Storage::url('upload/logo/')) . '/' . $data['logo'] }}"
                                style="height: 100px;" alt="">
                        </td>
                    </tr>

                    <!-- Body -->
                    <tr>
                        <td class="body532" style="padding: 40px; text-align: left; font-size: 16px; line-height: 1.6;">
                            <p><strong>{{ __('Dear') }} {{ $data['name'] }}</strong>,</p>
                            <p>&nbsp;</p>
                            <blockquote>
                                <p> {{ __('We are excited to have you on board and look forward to providing you with an exceptional experience.') }}</p>
                                <p>{{ __('We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.') }}</p>
                                <p>&nbsp;</p>
                                <p>{{ __('Your account details are as follows:') }}</p>
                                <p><strong>{{ __('App Link:') }}</strong> <a href="{{ $data['url'] }}">{{ $data['url'] }}</a></p>
                                <p><strong>{{ __('Username:') }}</strong> {{ $data['email'] }}</p>
                                <p><strong>{{ __('Password:') }}</strong> {{ $data['password'] }}</p>
                                <p>&nbsp;</p>
                                <p>{{ __('Thank you for choosing.') }}</p>
                            </blockquote>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>

</html>
