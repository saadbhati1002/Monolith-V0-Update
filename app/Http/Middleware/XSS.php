<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class XSS
{
    use \RachidLaasri\LaravelInstaller\Helpers\MigrationsHelper;

    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     *
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (\Auth::check()) {
            \App::setLocale(\Auth::user()->lang);
            $timezone = getSettingsValByName('timezone');
            \Config::set('app.timezone', $timezone);

            if (\Auth::user()->type == 'super admin') {
                $directoryMigrations             = $this->getMigrations();
                $databaseMigrations           = $this->getExecutedMigrations();
                $total = count($directoryMigrations) - count($databaseMigrations);
                if ($total > 0) {
                    return redirect()->route('LaravelUpdater::welcome');
                }
            }
        }

        $data = $request->all();

        $request->merge($data);
        return $next($request);
    }
}
