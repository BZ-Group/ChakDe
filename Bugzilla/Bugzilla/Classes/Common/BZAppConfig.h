//
//  BZAppConfig.h
//  Bugzilla
//
//  Created by Anoop on 3/17/14.
//  Copyright (c) 2014 iCoder. All rights reserved.
//

#ifndef Bugzilla_BZAppConfig_h
#define Bugzilla_BZAppConfig_h

#pragma mark - Constants

static NSString * const AFJSONRPCErrorDomain              = @"com.alamofire.networking.json-rpc";
static NSString * const BugzillaServerBaseURLString       = @"https://landfill.bugzilla.org/bugzilla-tip/jsonrpc.cgi"; /* @"https://bugzilla.mozilla.org/jsonrpc.cgi";*/

//// urls
static NSString * const BZServiceVersionURI               = @"Bugzilla.version";
static NSString * const BZServiceLoginURI                 = @"User.login";
static NSString * const BZServiceUserInfoURI              = @"User.get";
static NSString * const BZServiceAccessibleProductIdsURI  = @"Product.get_accessible_products";
static NSString * const BZServiceProductDetailsURI        = @"Product.get";
static NSString * const BZServiceBugSearch                = @"Bug.search";
static NSString * const BZServiceBugDetails               = @"Bug.get";



#endif
