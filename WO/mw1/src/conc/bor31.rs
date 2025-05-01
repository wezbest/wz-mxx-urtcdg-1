/*
Chapter 31 - Focus on borrowing rules
You will do all the exercises in this chapter using the same code.
*/

use crate::utils::{header, pswg};
use yansi::Paint;

///////////////// Main Function calls//////////////////

pub fn bor31_main() {
    pswg("Chapter 31 - Borrowing Rules".to_string());
    br1();
}

/////// Sub fuynctions for each exercise //////////

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

//// Function 1

fn br1_print_account(account: &Account) {
    println!("{:#?}", account.yellow());
}

fn br1() {
    header("F1 - Learning Borrowing Rules");

    let account = Account::new(1, String::from("Func Onner"));

    // Dont need to store the borrowed reference.
    let account_ref = &account;

    // Printing the account reference directly
    br1_print_account(&account);

    br1_print_account(account_ref);

    println!("{:#?}", account.cyan());

    let text1 = r"
Printing out only the specific
elements of the account struct.
---
";
    println!("{}", text1.green());
    println!("Account ID: {}", account.id);
    println!("Account Holder: {}", account.holder);
    println!("Account Balance: {}", account.balance);
    println!("Account Reference: {:#?}", account_ref);
}
