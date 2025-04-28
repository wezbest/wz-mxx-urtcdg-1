/*
Chapter 246 -
You will do all the exercises in this chapter using the same code.
*/

use crate::utils::{header, pswg};
use yansi::Paint;

////////////// Main Function calls//////////////////
pub fn exc26_main() {
    pswg("Chapter 26 - Excercises".to_string());
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

fn ex1() {
    header("Excercise 1");
}
