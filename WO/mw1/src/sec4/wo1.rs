/*
Work 1 - For this section on lifetimes
*/

use crate::utils::{header, pswg};
use yansi::Paint;

////// Main Entry function ///////

pub fn wo1_main() {
    // Header
    header("Work 1 - For this section on lifetimes");
    pswg("Lifetimes".to_string());

    // Print the text with a gradient
    println!(
        "{}",
        Paint::green("This is a test for the lifetimes section.")
    );
}
