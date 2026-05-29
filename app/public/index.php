<?php

echo "<h1>Elastic Beanstalk PHP App</h1>";
echo "<p>Deployed using Terraform + GitHub Actions CI/CD</p>";

echo "<pre>";
print_r([
    "environment" => getenv('APP_ENV'),
    "version" => getenv('APP_VERSION'),
    "time" => date('Y-m-d H:i:s')
]);
echo "</pre>";