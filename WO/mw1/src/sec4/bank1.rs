/*
Section 4  - Bank Project
- Thii is the same file from sec3/bank1.rs
*/

// Impors
use crate::utils::{header, pswg};
use yansi::Paint;

//////// /// Main function call ////////////
pub fn bank1_main() {
    sb_main_bank();
}

////// Sub functions here //////////

// Test function
fn sbtest() {
    pswg("Sub Bank 1".to_string());
    header("Sub Function test")
}

//// Sec1 - Bank Project Work Here //////////

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

    fn add_account(&mut self, account: Account) {
        self.accounts.push(account);
    }
}

//// Sub Function 1 Here ////////////

fn sb_main_bank() {
    pswg("Main Bank Function".to_string());

    let bank = Bank::new();
    let account1 = Account::new(1, "Alice".to_string());

    bank.add_account(account1);
}
