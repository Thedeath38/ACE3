
#define ALL_BODY_PARTS ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]

#define CUR_LEVEL (["Basic", "Advanced"] select (EGVAR(medical,level) >= 2))

// scale received pain to 0-2 level to select type of scream
// below 0.25: 0, from 0.25 to 0.5: 1, more than 0.5: 2
#define PAIN_TO_SCREAM(pain) (floor (4 * pain) min 2)

// scale received pain to 0-2 level to select type of scream
// below 0.33: 0, from 0.34 to 0.66: 1, more than 0.67: 2
#define PAIN_TO_MOAN(pain) (floor (3 * pain) min 2)

#define GET_NUMBER(config,default) (if (isNumber (config)) then {getNumber (config)} else {default})
#define GET_STRING(config,default) (if (isText (config)) then {getText (config)} else {default})
#define GET_ARRAY(config,default) (if (isArray (config)) then {getArray (config)} else {default})