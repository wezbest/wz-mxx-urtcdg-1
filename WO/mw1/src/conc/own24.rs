/*
Chapter 24 - using the same bank example to learn the owbership
and borrowing concepts in rust
*/

use crate::utils::{header, pswg};
use yansi::Paint;

pub fn conc_main() {
    pswg("Chapter 24 - Ownership in Rust".to_string());
    learn1();
}

///////////// Actual code starts here /////////////

// * Main struct
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

// Bank Struct that holds the Account structs
#[derive(Debug)]
struct Bank {
    accounts: Vec<Account>,
}

impl Bank {
    fn new() -> Self {
        Bank { accounts: vec![] }
    }
}

fn learn1_print_account(account: &Account) {
    println!("{:#?}", account.yellow());
}

fn learn1() {
    header("Ownership in Rust");

    let bank = Bank::new();
    let account = Account::new(1, String::from("John Doe"));

    println!()
}
