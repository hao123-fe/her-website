<?php

$github = 'https://github.com/hao123-fe/her';

$fisgithub = 'https://github.com/fex-team/fis';
$github_wiki = $github . '/wiki';

$fis_data = array(
    'title' => 'Welcome to the FIS pc-demo run on HER.',
    'description' => '适用于所有大中小企业的前端集成解决方案，为前端团体提供前端性能优化、静态资源管理、编译工具等技术基础，实现前端生产工业化。',
    'github' => $github,
    'docs' => array(
        array(
            'title' => 'What is Her',
            'doc' => 'what',
            'icon' => 'leaf',
            'wiki' => $github_wiki . '#what-is-her-'
        ),
        array(
            'title' => 'How to',
            'doc' => 'how',
            'icon' => 'eye-open',
            'wiki' => $github_wiki . '#how-to-'
        ),
        array(
            'title' => 'Why Her',
            'doc' => 'why',
            'icon' => 'fire',
            'wiki' => $github_wiki . '#why-her-'
        ),
        // array(
        //     'title' => 'Get start',
        //     'doc' => 'start',
        //     'icon' => 'gift',
        //     'wiki' => $github_wiki . '/1.Get%20start'
        // ),
    )
);