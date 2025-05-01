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
    header("L1 - Regarding Mutable References");

    let mut account = Account::new(1, String::from("Func Onner"));
}
