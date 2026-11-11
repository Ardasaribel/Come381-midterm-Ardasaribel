SENARYO : Emniyet Müdürlüğü Yönetim ve Olay Takip Sistemi

Bir emniyet müdürlüğü, sorumluluk bölgesinde meydana gelen olayları, görevli polis memurlarını ve vatandaşlardan gelen ihbarları 
düzenli bir şekilde takip edebilmek için bir otomasyon sistemi oluşturmak istemektedir.

Sistemde görev yapan polis memurlarının kimlik bilgileri, sicil numaraları, rütbeleri ve bağlı oldukları birimler kayıtlı bulunacaktır. 
Ayrıca her emniyet biriminin kendine ait birim numaraları ve birim adları da sistemde tutulacaktır.

Meydana gelen her olay, özel bir numara ile sisteme kaydedilecektir. Olayların gerçekleştiği yer, tarih, saat, olay türü ve olayla 
ilgili kısa ifadeler de bu kayıtta dahil edilecektir.

Vatandaşlardan gelen ihbarlar ise ihbar kodu, saati ve ihbarı yapan vatandaşlardan alınan T.C. kimlik numarası, 
ad-soyad ve iletişim bilgileriyle kaydedilecektir.

Ayrıca her olayda birden fazla polis memuru görev alabileceği, her polis memuru da farklı olaylarda görevlendirilebilecektir.


erDiagram
POLICE_UNIT {string unit_number PK
string unit_name
}
POLICE_OFFICER {string national_id_number
string contact_information
string personnel_number PK
string rank
string unit_number
}
INCIDENT {int incident_number PK
string incident_location
date incident_date
string incident_time
string incident_type
string statement
}
CITIZEN {string national_id_number PK
string full_name
string contact_information
}
REPORT { int report_code PK
date report_date
string report_time
}
POLICE_UNIT||--|{POLICE_OFFICER:works_in
INCIDENT||--|{REPORT:is_related_to
CITIZEN||--|{ REPORT:submits
OFFICER__INCIDENT{
string personel_number PK,FK
int incident_number PK,FK
}
POLICE_OFFICER||--o{OFFICER__INCIDENT:assigned_to
INCIDENT||--o{OFFICER__INCIDENT:includes


AÇIKLAMA : Veritabanının emniyet müdürlüğü yönetim sistemi için önemli ve uyarlanabilir olduğunu düşündüğümden dolayı bu konuyu seçmek istedim. Sınıflar oluşturdum ve sınıflar arası ilişkiler kurdum. Varlıklara nitelikler tanımladım. Bunları ER diyagramı üzerinde gösteren bir kod oluşturdum. Kişiye özel kısımlarda PK kullandım, bazı kısımlarda ortak tablo oluşturup FK tanımladım.

