// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>

@interface CustomViewController

@property (nonatomic, copy) NSString* newProperty;

+ (void)classMethod;

- (NSString*)getMyName;

- (void)newMethod:(NSString*) output;

@end

%hook CustomViewController

+ (void)classMethod
{
	%log;

	%orig;
}

%new
-(void)newMethod:(NSString*) output{
    NSLog(@"This is a new method : %@", output);
}

%new
- (id)newProperty {
    return objc_getAssociatedObject(self, @selector(newProperty));
}

%new
- (void)setNewProperty:(id)value {
    objc_setAssociatedObject(self, @selector(newProperty), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*)getMyName
{
	%log;
    
    NSString* password = MSHookIvar<NSString*>(self,"_password");
    
    NSLog(@"password:%@", password);
    
    [%c(CustomViewController) classMethod];
    
    [self newMethod:@"output"];
    
    self.newProperty = @"newProperty";
    
    NSLog(@"newProperty : %@", self.newProperty);

	return %orig();
}

%end


// 
// 去掉注释可去除应用BundleId校验
// 替换“逆向App Bundle id”

//%hook NSBundle
//- (NSString *)bundleIdentifier{
//    NSString *str =  @"逆向App Bundle ID";
//    NSArray *address = [NSThread callStackReturnAddresses];
//    NSDictionary *dic = [[NSBundle mainBundle]infoDictionary];
//    [dic setValue:@"逆向App Bundle ID" forKey:@"CFBundleIdentifier"];
//    Dl_info info = {0};
//    if(dladdr((void *)[address[2] longLongValue], &info) == 0) return %orig;
//    NSString *path = [NSString stringWithUTF8String:info.dli_fname];
//    if ([path hasPrefix:NSBundle.mainBundle.bundlePath]) {
//            NSLog(@"!!!!!!!!!!!!!");
//            return str;
//    } else {
//        //  二进制是系统或者越狱插件
//            NSLog(@"!!!!!!系统!!!!!!");
//            return %orig;
//    }
//}
//%end