#!/usr/bin/php
<?php

namespace App;

use Symfony\Component\Yaml\Yaml;

require_once __DIR__ . '/../vendor/autoload.php';

$output = Yaml::parseFile(__DIR__ . '/../config/git.yaml');

$gitName = $output['git']['name'];
$gitEmail = $output['git']['email'];

echo shell_exec("echo 'setup git user.name from vm.cfg'");
echo shell_exec("sudo git config --system user.name '$gitName' --replace-all");

echo shell_exec("echo 'setup git user.email from vm.cfg'");
echo shell_exec("sudo git config --system user.email '$gitEmail' --replace-all");
