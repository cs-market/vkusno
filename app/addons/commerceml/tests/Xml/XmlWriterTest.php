<?php
/***************************************************************************
 *                                                                          *
 *   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
 *                                                                          *
 * This  is  commercial  software,  only  users  who have purchased a valid *
 * license  and  accept  to the terms of the  License Agreement can install *
 * and use this program.                                                    *
 *                                                                          *
 ****************************************************************************
 * PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
 * "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
 ****************************************************************************/


namespace Tygh\Addons\CommerceML\Tests\Unit\Xml;


use Tygh\Addons\CommerceML\Tests\Unit\BaseXmlTestCase;
use Tygh\Addons\CommerceML\Xml\SimpleXmlElement;
use Tygh\Addons\CommerceML\Xml\XmlWritter;

class XmlWriterTest extends BaseXmlTestCase
{
    public function testConvertArrayToXml()
    {
        $data = [
            'Ид'          => '102',
            'Номер'       => '102',
            'Дата'        => '2020-11-16',
            'Время'       => '15:28:04',
            'ХозОперация' => 'Заказ товара',
            'Роль'        => 'Продавец',
            'Курс'        => 1,
            'Сумма'       => '669.95',
            'Валюта'      => 'USD',
            'Комментарий' => '',
            'Контрагенты' => [
                'Контрагент' => [
                    'Ид'                   => '3',
                    'Незарегистрированный' => 'Нет',
                    'Наименование'         => 'Nills George',
                    'Роль'                 => 'Продавец',
                    'ПолноеНаименование'   => 'Nills George',
                    'Фамилия'              => 'Nills',
                    'Имя'                  => 'George',
                    'Адрес'                => [
                        'Представление' => '01342, United States, New York, 60 Centre Street #5, -',
                        [
                            'АдресноеПоле' => [
                                'Тип'      => 'Почтовый индекс',
                                'Значение' => '01342',
                            ],
                        ],
                        [
                            'АдресноеПоле' => [
                                'Тип'      => 'Страна',
                                'Значение' => 'United States',
                            ],
                        ],
                        [
                            'АдресноеПоле' => [
                                'Тип'      => 'Город',
                                'Значение' => 'New York',
                            ],
                        ],
                        [
                            'АдресноеПоле' => [
                                'Тип'      => 'Адрес',
                                'Значение' => '60 Centre Street #5 -',
                            ],
                        ],
                    ],
                    'Контакты' => [
                        [
                            'Контакт' => [
                                'Тип'      => 'Почта',
                                'Значение' => 'dsds@example.com',
                            ],
                        ],
                        [
                            'Контакт' => [
                                'Тип'      => 'ТелефонРабочий',
                                'Значение' => '+1 646-386-3600',
                            ],
                        ]
                    ]
                ],
            ],
            'Скидки' => [
                'Скидка' => [
                    'Наименование' => 'Скидка на заказ',
                    'Сумма'        => 8,
                    'Процент'      => 1.23,
                    'УчтеноВСумме' => 'true',
                ],
            ],
            'Товары' => [
                [
                    'Товар' => [
                        'Ид'             => 'ORDER_DELIVERY',
                        'Наименование'   => 'Доставка заказа',
                        'ЦенаЗаЕдиницу'  => 28,
                        'Количество'     => 1,
                        'Сумма'          => 28,
                        'Коэффициент'    => 1,
                        'БазоваяЕдиница' => [
                            'attribute' => [
                                'Код'                => '796',
                                'НаименованиеПолное' => 'шт',
                                'text'               => 'шт',
                            ],
                        ],
                        'ЗначенияРеквизитов' => [
                            [
                                'ЗначениеРеквизита' => [
                                    'Наименование' => 'ВидНоменклатуры',
                                    'Значение'     => 'Услуга',
                                ]
                            ],
                            [
                                'ЗначениеРеквизита' => [
                                    'Наименование' => 'ТипНоменклатуры',
                                    'Значение'     => 'Услуга',
                                ]
                            ]
                        ],
                    ]
                ],
                [
                    'Товар' => [
                        'Ид'             => '126',
                        'Код'            => '126',
                        'Артикул'        => 'F01262AH0T',
                        'Наименование'   => 'Casio PRIZM fx-CG10',
                        'ЦенаЗаЕдиницу'  => 129.99000000000001,
                        'Количество'     => '5',
                        'Коэффициент'    => 1,
                        'БазоваяЕдиница' => [
                            'attribute' => [
                                'Код'                => '796',
                                'НаименованиеПолное' => 'шт',
                                'text'               => 'шт',
                            ],
                        ],
                        'ЗначенияРеквизитов' => [
                            [
                                'ЗначениеРеквизита' => [
                                    'Наименование' => 'ВидНоменклатуры',
                                    'Значение'     => 'Товар',
                                ],
                            ],
                            [
                                'ЗначениеРеквизита' => [
                                    'Наименование' => 'ТипНоменклатуры',
                                    'Значение'     => 'Товар',
                                ],
                            ],
                        ],
                        'Скидки' => [
                            'Скидка' => [
                                'Наименование' => 'Скидка на товар',
                                'Сумма'        => 8,
                                'УчтеноВСумме' => 'false',
                            ],
                            [
                                'Скидка' => [
                                    'Наименование' => 'Скидка на товар',
                                    'Сумма'        => 0,
                                    'УчтеноВСумме' => 'true',
                                ]
                            ]
                        ],
                        'СтавкиНалогов' => [
                            [
                                'СтавкаНалога' => [
                                    'Наименование' => 'VAT',
                                    'Ставка'       => '10.000',
                                ]
                            ]
                        ],
                        'Сумма' => 649.95000000000005,
                    ],
                ]
            ],
            'ЗначенияРеквизитов' => [
                [
                    'ЗначениеРеквизита' => [
                        'Наименование' => 'Статус заказа',
                        'Значение'     => 'Open',
                    ]
                ],
                [
                    'ЗначениеРеквизита' => [
                        'Наименование' => 'Опции товаров',
                        'Значение'     => 'Casio PRIZM fx-CG10: 3G Connectivity [Yes],; ',
                    ],
                ],
                [
                    'ЗначениеРеквизита' => [
                        'Наименование' => 'Метод оплаты',
                        'Значение'     => 'Credit card',
                    ],
                ],
                [
                    'ЗначениеРеквизита' => [
                        'Наименование' => 'Способ доставки',
                        'Значение'     => 'Custom shipping method',
                    ],
                ],
            ],
        ];

        $xml_writer = new \XMLWriter();
        $xml_writer->openMemory();
        $xml_writer->startDocument();
        $xml_writer->startElement(SimpleXmlElement::findAlias('commerceml'));

        $xmlWritter = new XmlWritter($xml_writer);
        $xml_writer = $xmlWritter->convertArrayToXml([SimpleXmlElement::findAlias('document') => $data]);
        $xml_writer->endElement();
        $xml_string = $xml_writer->outputMemory();

        $this->assertEquals(
            "<?xml version=\"1.0\"?>\n<КоммерческаяИнформация><Документ><Ид>102</Ид><Номер>102</Номер><Дата>2020-11-16</Дата><Время>15:28:04</Время><ХозОперация>Заказ товара</ХозОперация><Роль>Продавец</Роль><Курс>1</Курс><Сумма>669.95</Сумма><Валюта>USD</Валюта><Комментарий></Комментарий><Контрагенты><Контрагент><Ид>3</Ид><Незарегистрированный>Нет</Незарегистрированный><Наименование>Nills George</Наименование><Роль>Продавец</Роль><ПолноеНаименование>Nills George</ПолноеНаименование><Фамилия>Nills</Фамилия><Имя>George</Имя><Адрес><Представление>01342, United States, New York, 60 Centre Street #5, -</Представление><АдресноеПоле><Тип>Почтовый индекс</Тип><Значение>01342</Значение></АдресноеПоле><АдресноеПоле><Тип>Страна</Тип><Значение>United States</Значение></АдресноеПоле><АдресноеПоле><Тип>Город</Тип><Значение>New York</Значение></АдресноеПоле><АдресноеПоле><Тип>Адрес</Тип><Значение>60 Centre Street #5 -</Значение></АдресноеПоле></Адрес><Контакты><Контакт><Тип>Почта</Тип><Значение>dsds@example.com</Значение></Контакт><Контакт><Тип>ТелефонРабочий</Тип><Значение>+1 646-386-3600</Значение></Контакт></Контакты></Контрагент></Контрагенты><Скидки><Скидка><Наименование>Скидка на заказ</Наименование><Сумма>8</Сумма><Процент>1.23</Процент><УчтеноВСумме>true</УчтеноВСумме></Скидка></Скидки><Товары><Товар><Ид>ORDER_DELIVERY</Ид><Наименование>Доставка заказа</Наименование><ЦенаЗаЕдиницу>28</ЦенаЗаЕдиницу><Количество>1</Количество><Сумма>28</Сумма><Коэффициент>1</Коэффициент><БазоваяЕдиница Код=\"796\" НаименованиеПолное=\"&#x448;&#x442;\">шт</БазоваяЕдиница><ЗначенияРеквизитов><ЗначениеРеквизита><Наименование>ВидНоменклатуры</Наименование><Значение>Услуга</Значение></ЗначениеРеквизита><ЗначениеРеквизита><Наименование>ТипНоменклатуры</Наименование><Значение>Услуга</Значение></ЗначениеРеквизита></ЗначенияРеквизитов></Товар><Товар><Ид>126</Ид><Код>126</Код><Артикул>F01262AH0T</Артикул><Наименование>Casio PRIZM fx-CG10</Наименование><ЦенаЗаЕдиницу>129.99</ЦенаЗаЕдиницу><Количество>5</Количество><Коэффициент>1</Коэффициент><БазоваяЕдиница Код=\"796\" НаименованиеПолное=\"&#x448;&#x442;\">шт</БазоваяЕдиница><ЗначенияРеквизитов><ЗначениеРеквизита><Наименование>ВидНоменклатуры</Наименование><Значение>Товар</Значение></ЗначениеРеквизита><ЗначениеРеквизита><Наименование>ТипНоменклатуры</Наименование><Значение>Товар</Значение></ЗначениеРеквизита></ЗначенияРеквизитов><Скидки><Скидка><Наименование>Скидка на товар</Наименование><Сумма>8</Сумма><УчтеноВСумме>false</УчтеноВСумме></Скидка><Скидка><Наименование>Скидка на товар</Наименование><Сумма>0</Сумма><УчтеноВСумме>true</УчтеноВСумме></Скидка></Скидки><СтавкиНалогов><СтавкаНалога><Наименование>VAT</Наименование><Ставка>10.000</Ставка></СтавкаНалога></СтавкиНалогов><Сумма>649.95</Сумма></Товар></Товары><ЗначенияРеквизитов><ЗначениеРеквизита><Наименование>Статус заказа</Наименование><Значение>Open</Значение></ЗначениеРеквизита><ЗначениеРеквизита><Наименование>Опции товаров</Наименование><Значение>Casio PRIZM fx-CG10: 3G Connectivity [Yes],; </Значение></ЗначениеРеквизита><ЗначениеРеквизита><Наименование>Метод оплаты</Наименование><Значение>Credit card</Значение></ЗначениеРеквизита><ЗначениеРеквизита><Наименование>Способ доставки</Наименование><Значение>Custom shipping method</Значение></ЗначениеРеквизита></ЗначенияРеквизитов></Документ></КоммерческаяИнформация>",
            $xml_string
        );
    }
}
