#!/usr/bin/php
<?php

use Symfony\Component\Yaml\Yaml;

require_once __DIR__ . '/../vendor/autoload.php';

echo shell_exec("echo 'Setting up projects'");

$output = Yaml::parseFile(__DIR__ . '/../config/projects.yaml');

foreach ($output['groups'] as $group) {
    $groupName = $group['name'];

    if(!$groupName) {
        throw new \Exception('Missing group name');
    }

    echo shell_exec("sudo mkdir -p /var/www/$groupName");
    echo shell_exec("sudo chown -R vagrant:vagrant /var/www/$groupName");

    foreach ($group['projects'] as $project) {
        $projectName = $project['name'];

        if(!$projectName) {
            throw new \Exception('Missing project name');
        }

        echo shell_exec("echo 'Setting up project: $projectName'");
        $projectRepositoryUrl = $project['repositoryUrl'];
        echo shell_exec("sudo mkdir -p /var/www/$groupName/$projectName");
        echo shell_exec("sudo chown -R vagrant:vagrant /var/www/$groupName/$projectName");
        echo shell_exec("cd /var/www/$groupName/$projectName");

        if (count(scandir("/var/www/$groupName/$projectName")) == 2) {
            echo shell_exec("cd /var/www/$groupName/$projectName && git clone $projectRepositoryUrl .");
        } else {
            echo shell_exec("echo 'Project: $projectName directory is not empty. Ignoring cloning.'");
        }

        $hostsLine = $project['localIp'] . ' ' . $project['host'];
        echo shell_exec("if ! grep -q '$hostsLine' '/etc/hosts'; then echo '$hostsLine' | sudo tee -a /etc/hosts; fi");
    }
}
