# frozen_string_literal: true

module Admin
  module SeedConstant
    PRIMARY_ROLES = %w[
      software_engineer
      mobile_developer
      android_developer
      ios_developer
      frontend_engineer
      backend_engineer
      fullstack_engineer
      software_architect
      ai_engineer
    ].freeze

    ROLE_TYPES = %w[
      full_time
      part_time
      contract
      temporary
      volunteer
      internship
    ].freeze

    ROLE_LEVEL = %w[
      junior
      mid
      senior
      principal
      c_level
    ].freeze

    CATEGORIES = [
      'Software Engineer',
      'Quality Engineer',
      'UI/UX',
      'Sales & Marketing',
      'Management',
      'Operations',
      'Analyst'
    ].freeze

    PRIMARY_ROLES = {
      'Software Engineer' => [
        'Frontend Developer',
        'Backend Developer',
        'Full-stack Developer',
        'DevOps Engineer',
        'Embedded Systems Developer',
        'Mobile App Developer',
        'Game Developer',
        'Machine Learning Engineer',
        'Data Engineer'
      ],
      'Quality Engineer' => [
        'Manual Tester',
        'Automation Tester',
        'Performance Tester',
        'Security Tester',
        'Usability Tester',
        'Regression Tester',
        'Integration Tester',
        'Accessibility Tester',
        'Compatibility Tester',
        'Localization Tester',
        'Data Integrity Tester'
      ],
      'UI/UX' => [
        'UI Designer',
        'UX Designer',
        'Interaction Designer',
        'Visual Designer',
        'User Researcher',
        'Information Architect',
        'Usability Analyst'
      ],
      'Sales & Marketing' => [
        'Sales Representative',
        'Marketing Specialist',
        'Digital Marketer',
        'Content Marketer',
        'Social Media Manager',
        'SEO Specialist',
        'Brand Manager',
        'Product Marketer'
      ],
      'Management' => [
        'Project Manager',
        'Product Manager',
        'Scrum Master',
        'Team Lead',
        'Engineering Manager',
        'Operations Manager',
        'Business Development Manager'
      ],
      'Operations' => [
        'Operations Analyst',
        'Business Analyst',
        'Process Analyst',
        'Supply Chain Analyst',
        'Logistics Coordinator',
        'Quality Assurance Analyst'
      ],
      'Analyst' => [
        'Data Analyst',
        'Financial Analyst',
        'Market Analyst',
        'Business Analyst',
        'Operations Analyst',
        'Systems Analyst',
        'Research Analyst'
      ]
    }.freeze
    SKILLS = {
      'Software Engineer' => ['HTML', 'CSS', 'JavaScript', 'React', 'Angular', 'Vue.js', 'Java', 'Python', 'Ruby',
                              'Node.js', 'Spring Boot', 'Flask', 'Ruby on Rails', 'Docker', 'Kubernetes', 'Jenkins', 'Ansible', 'Terraform', 'AWS', 'Azure', 'Google Cloud', 'C', 'C++', 'Assembly', 'Arduino', 'Raspberry Pi', 'RTOS (Real-Time Operating Systems)', 'Swift', 'React Native', 'Flutter', 'Xamarin', 'Unity', 'Unreal Engine', 'C#', 'GameMaker', 'Godot Engine', 'TensorFlow', 'PyTorch', 'Scikit-learn', 'Keras', 'OpenCV', 'SQL', 'Apache Spark', 'Hadoop', 'Kafka', 'Airflow', 'AWS Glue'],
      'Quality Engineer' => ['TestRail', 'Zephyr', 'JIRA', 'Bugzilla', 'Microsoft Excel', 'Selenium', 'Cypress', 'Appium',
                             'TestComplete', 'Postman', 'Apache JMeter', 'LoadRunner', 'Gatling', 'OWASP ZAP', 'Burp Suite', 'Nessus', 'Metasploit', 'UsabilityHub', 'Optimal Workshop', 'UserTesting', 'WAVE', 'axe', 'NVDA', 'VoiceOver', 'BrowserStack', 'CrossBrowserTesting', 'Sauce Labs', 'LingoHub', 'PhraseApp', 'Transifex', 'Data validation tools'],
      'UI/UX' => ['Adobe XD', 'Sketch', 'Figma', 'Wireframe.cc', 'Balsamiq', 'InVision', 'Framer', 'Origami Studio',
                  'Adobe Photoshop', 'Adobe Illustrator', 'Google Analytics', 'Hotjar', 'Optimizely', 'Lucidchart', 'OmniGraffle', 'Miro', 'UsabilityHub', 'UserTesting', 'Optimal Workshop'],
      'Sales & Marketing' => ['Salesforce', 'HubSpot', 'Pipedrive', 'Google Analytics', 'Google Ads',
                              'Facebook Ads Manager', 'WordPress', 'Medium', 'BuzzSumo', 'Hootsuite', 'Buffer', 'Sprout Social', 'Google Search Console', 'Moz', 'SEMrush', 'Brandwatch', 'Productboard', 'Aha!', 'LinkedIn Sales Navigator', 'Mailchimp'],
      'Management' => ['Microsoft Project', 'Asana', 'Trello', 'Slack', 'JIRA', 'GitHub', 'Scrum.org', 'Agile Alliance',
                       'Slack', 'Trello', 'Google Workspace', 'Asana', 'Slack', 'TestRail', 'Zephyr', 'JIRA'],
      'Operations' => ['Microsoft Excel', 'SQL', 'Python', 'Microsoft Visio', 'Lucidchart', 'Miro', 'Lucidchart', 'Miro',
                       'Microsoft Visio', 'SAP', 'Oracle SCM Cloud', 'Blue Yonder (formerly JDA)', 'ShipStation', 'FreightPOP', 'Shippo', 'TestRail', 'Zephyr', 'JIRA'],
      'Analyst' => ['SQL', 'Python', 'R', 'Microsoft Excel', 'QuickBooks', 'Xero', 'Statista', 'Nielsen', 'Mintel',
                    'Lucidchart', 'Miro', 'Microsoft Visio', 'Microsoft Excel', 'SQL', 'Python', 'Lucidchart', 'Miro', 'Microsoft Visio', 'Mendeley', 'Google Scholar', 'PubMed']
    }.freeze

    INDUSTRY_OPTIONS = [
      'Information Technology',
      'Healthcare',
      'Education',
      'Finance',
      'Hospitality',
      'Retail',
      'Manufacturing',
      'Automotive',
      'Telecommunications',
      'Construction',
      'Media & Entertainment',
      'Transportation',
      'Energy',
      'Agriculture',
      'Real Estate',
      'Legal Services',
      'Consulting',
      'Marketing & Advertising',
      'Food & Beverage',
      'Pharmaceuticals'
    ].freeze

    SPECIALITY_OPTIONS = [
      'IT',
      'Engineering',
      'Sales',
      'Executive',
      'Technical',
      'Financial',
      'Accounting',
      'Engineering',
      'Scientific',
      'Mortgage',
      'Construction',
      'Operational',
      'Manufacturing',
      'BioTech',
      'Life Sciences',
      'Healthcare'
    ].freeze

    JOB_BOARDS = [
      remoteok: {}
    ].freeze
  end
end
