for (var n = 0; n < this.getPageNumWords(0); n++) {
    if (this.getPageNthWord(0, n) == "DigiNole") {
        this.deletePages(0);
        break;
    }
}
