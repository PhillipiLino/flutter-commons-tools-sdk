part of solfacil_tools_sdk;

const notEmptyRegex = r'^.*$';
const phoneNumberRegex = r'^\((\d{2})+\) +(\d{5})+\-\d{4}$';
const nameRegex = r'^[0-9a-zA-ZÀ-ÿ ]{0,180}$';
const fullNameRegex = r'^([A-Za-zÀ-Źà-ź]{2,})\s([A-Za-zÀ-Źà-ź-\s]{2,})$';
const usernameRegex = r'^([0-9a-zA-Z._]{3,20})$';
const emailRegex =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+";
const dateRegex =
    r'^(0[1-9]|[12][0-9]|3[01])(\/|-|\.)(0[1-9]|1[012])(\/|-|\.)(?:19|20)[0-9]{1}[0-9]{1}$';
