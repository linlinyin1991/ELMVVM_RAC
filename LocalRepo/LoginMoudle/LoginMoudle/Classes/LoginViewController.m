//
//  LoginViewController.m
//  LoginMoudle
//
//  Created by yin linlin on 2018/4/19.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginViewModel *viewModel;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *pwdTextField;
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    [self setRAC];
}

- (void)setupUI {
    [self.view addSubview:self.nameTextField];
    [self.view addSubview:self.pwdTextField];
    [self.view addSubview:self.loginBtn];
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.centerX.equalTo(self.view);
        make.height.equalTo(@30);
        make.top.equalTo(@100);
    }];
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameTextField);
        make.right.equalTo(self.nameTextField);
        make.height.equalTo(self.nameTextField);
        make.top.equalTo(self.nameTextField.mas_bottom).offset(20);
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@50);
        make.centerX.equalTo(self.view);
        make.height.equalTo(@40);
        make.top.equalTo(self.pwdTextField.mas_bottom).offset(50);
    }];
}

- (void)setRAC {
    RAC(self.viewModel, username) = self.nameTextField.rac_textSignal;
    RAC(self.viewModel, password) = self.pwdTextField.rac_textSignal;
//    RAC(self.loginBtn, enabled) = self.viewModel.validLoginSignal;
    @weakify(self);
    [self.viewModel.validLoginSignal subscribeNext:^(id x) {
        @strongify(self);
        if ([x boolValue]) {
            self.loginBtn.enabled = YES;
            self.loginBtn.backgroundColor = [UIColor blueColor];
        } else {
            self.loginBtn.backgroundColor = [UIColor lightGrayColor];
            self.loginBtn.enabled = NO;
        }
    }];
}
#pragma mark - lazy load
- (LoginViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[LoginViewModel alloc] init];
    }
    return _viewModel;
}

- (UITextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [[UITextField alloc] init];
        _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
        _nameTextField.placeholder = @"请输入用户名";
    }
    return _nameTextField;
}

- (UITextField *)pwdTextField {
    if (!_pwdTextField) {
        _pwdTextField = [[UITextField alloc] init];
        _pwdTextField.borderStyle = UITextBorderStyleRoundedRect;
        _pwdTextField.placeholder = @"请输入密码";
    }
    return _pwdTextField;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    }
    return _loginBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
