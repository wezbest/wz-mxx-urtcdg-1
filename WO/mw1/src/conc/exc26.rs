/*
Chapter 246 -
You will do all the exercises in this chapter using the same code.
*/

use crate::utils::{header, pswg};
use yansi::Paint;

////////////// Main Function calls//////////////////
pub fn exc26_main() {
    pswg("Chapter 26 - Excercises".to_string());
    ex2();
}

////// Excercise Functions here //////////

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

// --- Excercise 1 ---

fn ex1_print_accouunt(account: Account) {
    println!("{:#?}", account.green())
}

fn ex1() {
    header("Excercise 1");

    let account = Account::new(1, String::from("BootySniffer"));

    // TODO: Write and call a funcion that will *take ownership* of the account value, prin it, and return nothing

    // println!("{:#?}", account.green());
    ex1_print_accouunt(account);

    // Can u call this function twice
    // println!("{:#?}", account.green());
}

// --- Excercise 2 ---

fn ex2() {
    header("Excercise 2");
}
