using {ServiceCatalog as call} from '../service';

annotate call.ContactsSet with {
    FullName    @title: 'FullName';
    PhoneNumber @title: 'Phone Number';
    Email       @title: 'Email';
};

annotate call.ContactsSet with @(UI.FieldGroup #Contacts: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: FullName,
        },
        {
            $Type: 'UI.DataField',
            Value: PhoneNumber,
        },
        {
            $Type: 'UI.DataField',
            Value: Email,
        },
    ],
});
