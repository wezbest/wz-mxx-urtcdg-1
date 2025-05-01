/*
Ch35 - Mutable References
*/

use crate::utils::{header, pswg};
use yansi::Paint;

////////////// Main Function calls//////////////////
pub fn mur35_main() {
    pswg("Chapter 35 - Mutable References".to_string());
    learn1();
}

///////////////// Structs and Impl ////
#[derive(Debug)]
struct Account {
    balance: u32,
    id: u32,
    holder: String,
}
impl Account {
    fn new(id: u32, holder: String) -> Self {
        Account {
            id,
            holder,
            balance: 0,
        }
    }
}
#[derive(Debug)]
struct Bank {
    accounts: Vec<Account>,
}
impl Bank {
    fn new() -> Self {
        Bank { accounts: vec![] }
    }
}

////////////// learn1  Functions ////////////

fn learn1_print_account(account: &Account) {
    println!("{:#?}", account.yellow());
}

fn learn1() {
    header("F2 - Moving Vaues on Borrowed References");

    let account = Account::new(1, String::from("Func Onner"));

    // Dont need to store the borrowed reference.
    let account_ref = &account;

    // Making multiple reference to read only
    let account_ref1 = &account;
    let account_ref2 = &account;

    learn1_print_account(account_ref);

    println!("{:#?}", account.cyan());

    let text1 = r"
Printing out only the specific
elements of the account struct.
---
";
    println!("{}", text1.green());
    println!("Account ID: {}", account_ref.id);
    println!("Account Holder: {}", account_ref.holder);
    println!("Account Balance: {}", account_ref.balance);
    println!("Account Reference: {:#?}", account_ref);
}
