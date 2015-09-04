angular.module('clinikoApp').config(function($authProvider , $stateProvider, $locationProvider, $urlRouterProvider, $ocLazyLoadProvider){
      
	$authProvider.configure({
        apiUrl: 'http://api.example.com'
    });
      // For any unmatched url, send to /route1
     $urlRouterProvider.otherwise("/dashboard");
	  $locationProvider.hashPrefix('!');

        $stateProvider
		.state('login', {
		  url: "/login",
		 templateUrl: '/templates/common/login.html',
         data : { pageTitle: 'Login' },
            controller: 'authCtrl',
            resolve: {
                  
                    loadModule: ['$ocLazyLoad', function ($ocLazyLoad) {
                        return $ocLazyLoad.load('assets/angular/controllers/common/loginCtrl.js');
                    }]
                }
		})
		.state('dashboard', {
		  url: "/dashboard",
		  templateUrl: "/templates/dashboard/dashboard.html",
		  controller: 'dashboardCtrl',
          data : { pageTitle: 'Dashboard', requireLogin : true },
		    resolve: {
                    loadModule: ['$ocLazyLoad', function ($ocLazyLoad) {
                        return $ocLazyLoad.load('assets/angular/controllers/dashboard/dashboardCtrl.js');
                    }]
                },
              })
    .state('settings', {
      url: "/settings/account",
      templateUrl: "/templates/settings/account-settings.html",
      controller: 'settingCtrl',
      data : { pageTitle: 'Account', navlink: 'Account' }
    })
    .state('settings/business', {
      url: "/settings/business",
      templateUrl: "/templates/settings/business-information.html",
      controller: 'businessSettingCtrl',
          data : { pageTitle: 'Business Information', navlink : 'Business Information'  }
    })
	.state('settings/online-booking', {
      url: "/settings/online-booking",
      templateUrl: "/templates/settings/online-booking.html",
      controller: 'businessSettingCtrl',
          data : { pageTitle: 'Online Booking', navlink : 'Online Booking'  }
    })
	.state('settings/concession-types', {
      url: "/settings/concession-types",
      templateUrl: "/templates/settings/concession-types.html",
      controller: 'businessSettingCtrl',
          data : { pageTitle: 'Concession Types', navlink : 'Concession Types'  }
    })
	.state('settings/taxes', {
      url: "/settings/taxes",
      templateUrl: "/templates/settings/taxes.html",
      controller: 'businessSettingCtrl',
          data : { pageTitle: 'Taxes', navlink : 'Taxes'  }
    })
	.state('settings/referral-types', {
      url: "/settings/referral-types",
      templateUrl: "/templates/settings/referral-types.html",
      controller: 'businessSettingCtrl',
          data : { pageTitle: 'Referral Types', navlink : 'Referral Types'  }
    })
	.state('settings/sms-setting', {
      url: "/settings/sms-setting",
      templateUrl: "/templates/settings/sms-setting.html",
      controller: 'businessSettingCtrl',
          data : { pageTitle: 'SMS Setting', navlink : 'SMS Setting'  }
    })
	.state('settings/recall-types', {
      url: "/settings/recall-types",
      templateUrl: "/templates/settings/recall-types.html",
      controller: 'businessSettingCtrl',
          data : { pageTitle: 'Recall Types', navlink : 'Recall Types'  }
    })
	.state('settings/payment-types', {
      url: "/settings/payment-types",
      templateUrl: "/templates/settings/payment-types.html",
      controller: 'businessSettingCtrl',
          data : { pageTitle: 'Payment Types', navlink : 'Payment Types'  }
    })
	.state('settings/subscription', {
      url: "/settings/subscription",
      templateUrl: "/templates/settings/subscription.html",
      controller: 'businessSettingCtrl',
          data : { pageTitle: 'ZULU Subscription', navlink : 'ZULU Subscription'  }
    })
	.state('settings/treatment-notes', {
      url: "/settings/treatment-notes",
      templateUrl: "/templates/settings/treatment-notes.html",
      controller: 'businessSettingCtrl',
          data : { pageTitle: 'Treatment Notes', navlink : 'Treatment Notes'  }
    })
	.state('settings/treatment-notes-edit', {
      url: "/settings/treatment-notes-edit",
      templateUrl: "/templates/settings/treatment-notes-edit.html",
      controller: 'businessSettingCtrl',
          data : { pageTitle: 'Treatment Notes', navlink : 'Treatment Notes'  }
    })
	.state('settings/appointment', {
      url: "/settings/appointment",
      templateUrl: "/templates/settings/appointment-types.html",
      controller: 'businessSettingCtrl',
          data : { pageTitle: 'Appointment Types', navlink : 'Appointment Types'  }
    })
    
    .state('settings/users', {
      url: "/settings/users",
      templateUrl: "/templates/settings/users-practitioners.html",
      controller: 'UserSettingCtrl',
          data : { pageTitle: 'User & Practitioners', navlink : 'User & Practitioners'  }
    });

    });
