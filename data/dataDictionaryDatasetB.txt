Data dictionary for Dataset B.

This data consists of 78 volunteer subjects tested at a local retirement community over a two month period. Patients were randomly assigned to have either a treatment or placebo. Since the study was double-blinded, neither the nurses who conducted the measurements nor the patients knew whether they received placebo or not.

The data was derived from a snapshot of the data warehouse.

patientID - unique patient identifier
startWeights - weight of patient at start of study, in kg. Note that this measurement was conducted automatically and entered into the patient record. 
endWeights - weight of patient collected at second datapoint, in kg. Note that this measurement was conducted automatically. A value of NA means that the patient chose to drop out of the study.
treatment - whether patient received treatment or placebo.
dateStart - date startWeight was collected, in MM/DD/YYYY format.
dateEnd - date endWeight was collected, in MM/DD/YYYY format.
gender - gender of patient. A value of NA means that the patient did not want their gender recorded. 
age - age of patients (in years). 
Nurse - unique nurse identifier who took measurements.